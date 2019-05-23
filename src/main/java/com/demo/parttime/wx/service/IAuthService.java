package com.demo.parttime.wx.service;

import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.wx.entity.Auth;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.parttime.wx.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 52123
 * @since 2019-04-27
 */
public interface IAuthService extends IService<Auth> {

    /**
     *  保存认证信息并将状态调正为审核
     * @param user 用户
     * @param auth 认证信息
     * @return BaseResp
     */
    BaseResp saveAuthInfo(User user, Auth auth);
}
