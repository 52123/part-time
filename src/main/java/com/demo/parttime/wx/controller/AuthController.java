package com.demo.parttime.wx.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.Auth;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.service.IAuthService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 52123
 * @since 2019-04-27
 */
@RestController
@RequestMapping("/auth")
public class AuthController {

    @Resource
    private IAuthService authService;

    @PostMapping("/save")
    public BaseResp saveAuth(@WxUser User user, @RequestBody Auth auth){
        return authService.saveAuthInfo(user, auth);
    }

    @GetMapping("/check")
    public BaseResp checkAuth(@WxUser User user){
        Auth auth = (Auth)new Auth().selectOne(new QueryWrapper<Auth>().eq("user_id",user.getId()));
        return auth == null ? BaseResp.fail() : BaseResp.success(auth);
    }
}
