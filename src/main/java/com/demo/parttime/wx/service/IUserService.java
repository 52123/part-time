package com.demo.parttime.wx.service;

import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.dto.req.WxUserInfoSaveReq;
import com.demo.parttime.wx.dto.resp.WxTokenResp;
import com.demo.parttime.wx.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
public interface IUserService extends IService<User> {

    /**
     *  根据code获取openID并返回用户ID
     * @param code 登陆凭证
     * @return 用户ID，String
     */
    WxTokenResp saveOpenId(String code);

    /**
     *  保存或更新微信用户信息
     * @param user 已登录的用户信息
     * @param userDto 传入的用户信息
     * @return
     */
    BaseResp saveOrUpdateUser(User user, WxUserInfoSaveReq userDto);

    /**
     *  获取用户的信誉
     * @param user
     * @return
     */
    BaseResp getUserCredit(User user);
}
