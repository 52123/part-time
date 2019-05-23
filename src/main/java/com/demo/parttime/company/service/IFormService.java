package com.demo.parttime.company.service;

import com.demo.parttime.company.dto.req.DeliverStatusReq;
import com.demo.parttime.company.entity.Form;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.common.model.WebResp;
import com.demo.parttime.wx.entity.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
public interface IFormService extends IService<Form> {

    /**
     *  报名
     * @param userId 用户id
     * @param pId 兼职信息id
     * @return BaseResp
     */
    BaseResp signUp(Integer userId, Integer pId);

    /**
     *  获取投递列表
     * @param user 用户
     * @param req 状态
     * @return BaseResp
     */
    WebResp getDeliverList(User user, DeliverStatusReq req);
}
