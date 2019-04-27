package com.demo.parttime.wx.controller;


import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.service.ISchoolService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author 52123
 * @since 2019-04-28
 */
@RestController
@RequestMapping("/school")
public class SchoolController {

    @Resource
    private ISchoolService schoolService;

    @GetMapping("/getSchoolList")
    public BaseResp getList(){
        return schoolService.getSchoolList();
    }
}
