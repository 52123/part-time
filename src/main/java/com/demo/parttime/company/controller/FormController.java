package com.demo.parttime.company.controller;


import com.demo.parttime.company.dto.req.DeliverStatusReq;
import com.demo.parttime.company.service.IFormService;
import com.demo.parttime.common.model.WebResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
@RestController
@RequestMapping("/deliver")
public class FormController {

    @Resource
    private IFormService formService;

    @PostMapping("/getList")
    public WebResp getDeliverList(@WxUser User user, @RequestBody DeliverStatusReq req){
        return formService.getDeliverList(user, req);
    }
}
