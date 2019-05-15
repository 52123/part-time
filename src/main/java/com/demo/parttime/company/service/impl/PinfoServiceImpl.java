package com.demo.parttime.company.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.company.annotation.ObjectCacheable;
import com.demo.parttime.company.dto.req.PartTimeSectionReq;
import com.demo.parttime.company.dto.resp.PartTimeSectionResp;
import com.demo.parttime.company.entity.Pinfo;
import com.demo.parttime.company.mapper.PinfoMapper;
import com.demo.parttime.company.service.IPinfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.util.WebResp;
import com.demo.parttime.util.search.LuceneQuery;
import com.demo.parttime.util.search.LuceneResult;
import com.demo.parttime.util.search.LuceneSearchService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.TermQuery;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
@Service
public class PinfoServiceImpl extends ServiceImpl<PinfoMapper, Pinfo> implements IPinfoService {

    @Resource
    private LuceneSearchService searchService;

    private String successCode = "0000";

    //todo 以后从数据库里读取

    private static final String[] TYPES = {"create_time", "salary", "address"};

    private static final String[] ADDRESSES = {"不限", "南海", "禅城", "顺德", "三水", "高明"};

    /**
     * @param req 返回信息条件
     * @return 兼职列表
     * @annotation 官方注解 @Cacheable(cacheNames = "ptList",key = "#req.type + ':' + #req.address + ':' + #req.categoryId + ':'+ #req.pageNum + ':' + #req.pageSize + ':' + #req.search")
     */
    @Override
    @SuppressWarnings("unchecked")
    @ObjectCacheable(key = "ptList:{}:{}:{}:{}:{}:{}", fields = {"type", "address", "categoryId", "pageNum", "pageSize", "search"})
    public WebResp getPartTimeList(PartTimeSectionReq req) {

        // 先判断类型跟地址数据是否合法
        String type = req.getType();
        String address = req.getAddress();
        if (!hasTypeAndAddress(type, address)) {
            return new WebResp().fail("400", "参数值有误");
        }


        // 获取页数
        int pageSize = req.getPageSize() == null || req.getPageSize() <= 0 ? 8 : req.getPageSize();
        int pageNum = req.getPageNum() == null || req.getPageNum() <= 0 ? 1 : req.getPageNum();

        // 判断search的值是否合法
        String search = req.getSearch();
        boolean searchCondition = isLegalSearch(search);

        // 判断是否需要按类目进行选取
        Integer categoryId = req.getCategoryId();
        boolean categoryCondition = isLegalCategoryValue(categoryId);

        // 判断地址是否需要检索
        boolean addressCondition = !ADDRESSES[0].equals(address);

        // 当有地址或者搜索值时使用搜索引擎
        LuceneQuery query = new LuceneQuery();
        if (searchCondition) {
            query.addQuery(new TermQuery(new Term("title", search)));
        }
        if (addressCondition) {
            query.addQuery(new TermQuery(new Term("address", address)));
        }
        if (categoryCondition) {
            query.addQuery(new TermQuery(new Term("category", categoryId.toString())));
        }
        if (searchCondition || addressCondition) {
            query.addQuery(new TermQuery(new Term("publish", "1")));
            query.addQuery(new TermQuery(new Term("status", "1")));
            long start = System.currentTimeMillis();
            LuceneResult result = searchService.search(query);
            System.out.println(System.currentTimeMillis() - start);
            if (successCode.equals(result.getCode())) {
                List<PartTimeSectionResp> respList = new ArrayList<>();
                for (Map map : result.getData()) {
                    PartTimeSectionResp resp = JSON.parseObject(String.valueOf(map.get("data")), PartTimeSectionResp.class);
                    respList.add(resp);
                }
                return new WebResp().success(respList, result.getTotalHits() / pageSize + 1);
            }
        }


        // 如果按工作区域来显示，则按create_time进行排序
        PageHelper.startPage(pageNum, pageSize);
        List<Pinfo> pinfoList = new Pinfo().selectList(new QueryWrapper<Pinfo>().eq(categoryCondition, "category_id", categoryId)
                .eq("status", 1).eq("publish", 1)
                .orderByDesc("address".equals(type) ? "create_time" : type));


        // 命中总数和总页数
        Integer totalPage = null;
        if (req.getPageNum() != null && req.getPageNum() > 0) {
            long totalHit = new PageInfo(pinfoList).getTotal();
            totalPage = (int) totalHit / pageSize + 1;
        }


        // 封装DTO
        List<PartTimeSectionResp> respList = new ArrayList<>();
        for (Pinfo info : pinfoList) {
            PartTimeSectionResp resp = new PartTimeSectionResp();
            resp.setAddress(info.getAddress());
            resp.setCreateTimeToString(info.getCreateTime());
            resp.setId(info.getId());
            resp.setLongTerm(info.getLongTerm());
            resp.setSalary(info.getSalary());
            resp.setTitle(info.getTitle());
            resp.setCompanyName(info.getCompanyName());
            respList.add(resp);
        }
        return new WebResp().success(respList, totalPage);
    }

    @Override
    public BaseResp getPartTImeDetail(Integer id) {
        Pinfo pinfo = (Pinfo) new Pinfo().selectById(id);
        if (pinfo.getStatus() == 1 && pinfo.getPublish() == 1) {
            pinfo.setView(pinfo.getView() + 1);
            pinfo.updateById();
            return BaseResp.success(pinfo);
        }
        return BaseResp.fail("0002", "该兼职不存在，或已过期");
    }

    private boolean isLegalCategoryValue(Integer categoryId) {
        return categoryId != null && categoryId >= 0;
    }

    private boolean isLegalSearch(String search) {
        return StringUtils.isNotBlank(search);
    }

    private boolean hasTypeAndAddress(String type, String address) {
        boolean hasType = false;
        boolean hasAddress = false;

        for (String str : TYPES) {
            if (str.equals(type)) {
                hasType = true;
            }
        }

        for (String addr : ADDRESSES) {
            if (addr.equals(address)) {
                hasAddress = true;
            }
        }

        return hasAddress && hasType;
    }
}
