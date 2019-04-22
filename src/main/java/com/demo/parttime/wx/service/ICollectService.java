package com.demo.parttime.wx.service;

import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.entity.Collect;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.parttime.wx.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 52123
 * @since 2019-04-22
 */
public interface ICollectService extends IService<Collect> {

    /**
     *  收藏
     * @param user 用户
     * @param id 兼职id
     * @return BaseResp
     */
    BaseResp favorite(User user, Integer id);
}
