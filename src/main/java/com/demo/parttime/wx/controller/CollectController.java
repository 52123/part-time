package com.demo.parttime.wx.controller;


import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.Collect;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.service.ICollectService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 52123
 * @since 2019-04-22
 */
@RestController
@RequestMapping("/collect")
public class CollectController {

    @Resource
    private ICollectService collectService;

    @PostMapping("/favorite/{id}")
    public BaseResp favorite(@WxUser User user, @PathVariable("id") Integer id) {
        return collectService.favorite(user, id);
    }

    @PostMapping("/isCollect/{id}")
    public BaseResp isCollect(@WxUser User user, @PathVariable("id") Integer id) {
        String index = user.getId() + "_" + id;
        return new Collect().selectById(index) != null
                ? BaseResp.success(true) : BaseResp.success(false);
    }

    @PostMapping("/cancel/{id}")
    public BaseResp cancel(@WxUser User user, @PathVariable("id") Integer id) {
        String index = user.getId() + "_" + id;
        return new Collect().deleteById(index)
                ? BaseResp.success(true) : BaseResp.success(false);
    }
}