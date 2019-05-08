package com.demo.parttime.wx.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.company.dto.resp.PartTimeSectionResp;
import com.demo.parttime.company.entity.Pinfo;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.util.WebResp;
import com.demo.parttime.wx.entity.Collect;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.mapper.CollectMapper;
import com.demo.parttime.wx.service.ICollectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 52123
 * @since 2019-04-22
 */
@Service
public class CollectServiceImpl extends ServiceImpl<CollectMapper, Collect> implements ICollectService {

    @Value("${LOGIN_SHOW_NUM}")
    private Integer pageSize;

    @Override
    public BaseResp favorite(User user, Integer id) {
        Collect collect = (Collect) new Collect().selectOne(new QueryWrapper<Collect>().eq("user_id",user.getId()).eq("p_id",id));
        if(collect == null){
            collect = new Collect();
            collect.setPId(id);
            collect.setUserId(user.getId());
            return collect.insert() ? BaseResp.success() : BaseResp.fail();
        }
        return BaseResp.success();
    }

    @Override
    @SuppressWarnings("unchecked")
    public WebResp getFavorList(User user, Integer pageNum) {
        pageNum = pageNum == null || pageNum <= 0 ? 1 : pageNum;

        PageHelper.startPage(pageNum, pageSize);
        List<Collect> collectList = new Collect().selectList(new QueryWrapper<Collect>().eq("user_id",user.getId()));

        List<PartTimeSectionResp> partTimeList = new ArrayList<>();
        for (Collect collect : collectList) {
            Pinfo pinfo = (Pinfo) new Pinfo().selectOne(new QueryWrapper<Pinfo>().eq("id", collect.getPId()));
            PartTimeSectionResp partTimeSection = new PartTimeSectionResp();
            partTimeSection.setLongTerm(pinfo.getLongTerm());
            partTimeSection.setCompanyName(pinfo.getCompanyName());
            partTimeSection.setTitle(pinfo.getTitle());
            partTimeSection.setId(pinfo.getId());
            partTimeSection.setCreateTimeToString(pinfo.getCreateTime());
            partTimeSection.setAddress(pinfo.getAddress());
            partTimeSection.setSalary(pinfo.getSalary());
            partTimeList.add(partTimeSection);
        }

        //命中总数和总页数
        long totalHit = new PageInfo(collectList).getTotal();
        Integer totalPage =  (int) (totalHit / pageSize + 1);

        return new WebResp().success(partTimeList, totalPage);
    }
}
