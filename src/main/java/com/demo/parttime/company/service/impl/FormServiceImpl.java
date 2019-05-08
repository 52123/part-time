package com.demo.parttime.company.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.company.dto.req.DeliverStatusReq;
import com.demo.parttime.company.dto.resp.PartTimeSectionResp;
import com.demo.parttime.company.entity.Form;
import com.demo.parttime.company.entity.Pinfo;
import com.demo.parttime.company.mapper.FormMapper;
import com.demo.parttime.company.service.IFormService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.util.WebResp;
import com.demo.parttime.wx.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
@Service
public class FormServiceImpl extends ServiceImpl<FormMapper, Form> implements IFormService {

    @Override
    public BaseResp signUp(Integer userId, Integer pId) {
        Form form = (Form)new Form().selectOne(new QueryWrapper<Form>()
                .eq("p_id",pId).eq("user_id",userId));
        if(form == null){
            form = new Form();
            form.setUserId(userId);
            form.setPId(pId);
            return form.insert() ? BaseResp.success() : BaseResp.fail();
        }
        return BaseResp.success();
    }

    @Override
    @SuppressWarnings("unchecked")
    public WebResp getDeliverList(User user, DeliverStatusReq req) {
        Integer status = req.getStatus();
        boolean statusCondition = needStatus(status);

        // 获取页数
        int pageSize = req.getPageSize() == null || req.getPageSize() <= 0 ? 8 : req.getPageSize();
        int pageNum = req.getPageNum() == null || req.getPageNum() <= 0 ? 1 : req.getPageNum();

        PageHelper.startPage(pageNum,pageSize);
        List<Form> formList = new Form().selectList(new QueryWrapper<Form>()
                .eq("user_id",user.getId()).eq(statusCondition,"status",status));

        //封装DTO
        List<PartTimeSectionResp> partTimeList = new ArrayList<>();
        formList.stream().map(form -> (Pinfo) new Pinfo().selectOne(new QueryWrapper<Pinfo>().eq("id", form.getPId()))).forEach(pinfo -> {
            PartTimeSectionResp partTimeSection = new PartTimeSectionResp();
            partTimeSection.setLongTerm(pinfo.getLongTerm());
            partTimeSection.setCompanyName(pinfo.getCompanyName());
            partTimeSection.setTitle(pinfo.getTitle());
            partTimeSection.setId(pinfo.getId());
            partTimeSection.setCreateTimeToString(pinfo.getCreateTime());
            partTimeSection.setAddress(pinfo.getAddress());
            partTimeSection.setSalary(pinfo.getSalary());
            partTimeList.add(partTimeSection);
        });

        // 命中总数和总页数
        Integer totalPage = null;
        if(req.getPageNum()!= null &&  req.getPageNum() > 0){
            long totalHit = new PageInfo(formList).getTotal();
            totalPage = (int)totalHit / pageSize + 1;
        }

        return new WebResp().success(partTimeList,totalPage);
    }

    private boolean needStatus(Integer status) {
        return status != null && status >=0;
    }
}
