package com.demo.parttime.wx.service;

import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.wx.entity.School;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 52123
 * @since 2019-04-28
 */
public interface ISchoolService extends IService<School> {

    /**
     * 返回所有的学校、学院
     * @return BaseResp
     */
    BaseResp getSchoolList();
}
