package com.demo.parttime.company.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.company.dto.req.PartTimeSectionReq;
import com.demo.parttime.company.dto.resp.PartTimeSectionResp;
import com.demo.parttime.company.entity.Pinfo;
import com.demo.parttime.company.mapper.PinfoMapper;
import com.demo.parttime.company.service.IPinfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.demo.parttime.util.BaseResp;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
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
public class PinfoServiceImpl extends ServiceImpl<PinfoMapper, Pinfo> implements IPinfoService {

    private static final int INDEX_SHOW_NUM = 8;

    //todo 以后从数据库里读取

    private static final String[] TYPES = {"create_time","salary","address"};

    private static final String[] ADDRESSES = {"All","南海","禅城","三水","高明"};

    @Override
    @SuppressWarnings("unchecked")
    public BaseResp getInfoForIndex(PartTimeSectionReq req) {
        String type = req.getType();
        String address = req.getAddress();
       if(!hasTypeAndAddress(type, address)){
           return BaseResp.fail("400","参数值有误");
       }

        List<Pinfo> pinfoList;
        // todo 从缓存中读取
       if(!TYPES[2].equals(type)){
          pinfoList = new Pinfo().selectList(new QueryWrapper<Pinfo>().eq("status",1).orderByDesc(type).last("limit 8"));
       }else{
           if(ADDRESSES[0].equals(address)){
               pinfoList = new Pinfo().selectList(new QueryWrapper<Pinfo>().eq("status",1).orderByDesc(type).last("limit 8"));
           }else{
               pinfoList = new Pinfo().selectList(new QueryWrapper<Pinfo>().eq("status",1).like("address",address).last("limit 8"));
           }
       }

        List<PartTimeSectionResp> respList = new ArrayList<>();
        for(Pinfo info : pinfoList){
            PartTimeSectionResp resp = new PartTimeSectionResp();
            resp.setAddress(info.getAddress());
            resp.setCreateTime(info.getCreateTime());
            resp.setId(info.getId());
            resp.setSalary(info.getSalary());
            resp.setTitle(info.getTitle());
            resp.setCompanyName(info.getCompanyName());
            respList.add(resp);
        }
        return BaseResp.success(respList);
    }

    private boolean hasTypeAndAddress(String type, String address){
        boolean hasType = false;
        boolean hasAddress = false;

        for(String str : TYPES){
            if(str.equals(type)){
                hasType = true;
            }
        }

        for(String addr : ADDRESSES){
            if(addr.equals(address)){
                hasAddress = true;
            }
        }

        return hasAddress && hasType;
    }
}
