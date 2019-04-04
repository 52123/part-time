package com.demo.parttime.wx.controller;



import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.dto.req.WxUserInfoSaveReq;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.service.IUserService;
import org.springframework.web.bind.annotation.*;

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
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @PostMapping("/json2CodeSession")
    public BaseResp getOpenId(@RequestParam("code") String code){
        return userService.saveOpenId(code);
    }

    @PostMapping("/saveOrUpdateUserInfo")
    public BaseResp saveOrUpdateUser(@WxUser User user, @RequestBody WxUserInfoSaveReq userDto){
        return userService.saveOrUpdateUser(user, userDto);
    }

    @PostMapping("getUserCredit")
    public BaseResp getUserInfo(@WxUser User user){
        return userService.getUserCredit(user);
    }
}
