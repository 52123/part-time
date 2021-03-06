package com.demo.parttime.company.service;

import com.demo.parttime.company.dto.req.PartTimeSectionReq;
import com.demo.parttime.company.entity.Pinfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.common.model.WebResp;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
public interface IPinfoService extends IService<Pinfo> {

    /**
     *  首页兼职信息接口
     * @param req 返回信息条件
     * @return BaseResp
     */
    WebResp getPartTimeList(PartTimeSectionReq req);

    /**
     *  获取兼职详情
     * @param id 兼职id
     * @return BaseResp
     */
    BaseResp getPartTImeDetail(Integer id);
}
