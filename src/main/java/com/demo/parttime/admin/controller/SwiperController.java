package com.demo.parttime.admin.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.admin.entity.Swiper;
import com.demo.parttime.admin.service.ISwiperService;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 52123
 * @since 2019-04-12
 */
@RestController
@RequestMapping("/swiper")
public class SwiperController {

    @Resource
    private ISwiperService swiperService;

    @GetMapping("/getSwiper")
    public BaseResp getSwiper(){
        return BaseResp.success(swiperService.listObjs(new QueryWrapper<Swiper>().eq("valid",1).last("limit 5")));
    }


}
