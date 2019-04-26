package com.demo.parttime.wx.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.util.WebResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.Collect;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.service.ICollectService;
import org.springframework.web.bind.annotation.*;

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
        return new Collect().selectOne(new QueryWrapper<Collect>().eq("user_id",user.getId()).eq("p_id",id)) != null
                ? BaseResp.success(true) : BaseResp.success(false);
    }

    @PostMapping("/cancel/{id}")
    public BaseResp cancel(@WxUser User user, @PathVariable("id") Integer id) {
        return new Collect().delete(new QueryWrapper<Collect>().eq("user_id",user.getId()).eq("p_id",id))
                ? BaseResp.success(true) : BaseResp.success(false);
    }

    @GetMapping("/getFavorList/{pageNum}")
    public WebResp getFavorList(@WxUser User user,@PathVariable("pageNum") Integer pageNum){
        return collectService.getFavorList(user,pageNum);
    }
}