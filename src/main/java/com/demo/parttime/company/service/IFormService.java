package com.demo.parttime.company.service;

import com.demo.parttime.company.entity.Form;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.parttime.util.BaseResp;

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
}
