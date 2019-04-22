package com.demo.parttime.wx.service.impl;

import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.entity.Collect;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.mapper.CollectMapper;
import com.demo.parttime.wx.service.ICollectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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

    @Override
    public BaseResp favorite(User user, Integer id) {
        String index= user.getId() + "_" + id;
        Collect collect = (Collect) new Collect().selectById(index);
        if(collect == null){
            collect = new Collect();
            collect.setId(index);
            collect.setPId(id);
            collect.setUserId(user.getId());
            return collect.insert() ? BaseResp.success() : BaseResp.fail();
        }
        return BaseResp.success();
    }
}
