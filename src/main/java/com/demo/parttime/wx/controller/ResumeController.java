package com.demo.parttime.wx.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.Resume;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.service.IResumeService;
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
@RequestMapping("/resume")
public class ResumeController {

    @Resource
    private IResumeService resumeService;

    @PostMapping("/save")
    public BaseResp saveResume(@WxUser User user, @RequestBody Resume resume){
        return resumeService.saveResume(user,resume);
    }

    @GetMapping("/getInfo")
    public BaseResp getResume(@WxUser User user){
        return BaseResp.success(new Resume().selectOne(
                new QueryWrapper<Resume>().eq("user_id",user.getUserId())));
    }
}
