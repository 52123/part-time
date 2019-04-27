package com.demo.parttime.admin.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.admin.entity.Us;
import com.demo.parttime.util.BaseResp;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
@RestController
@RequestMapping("/about")
public class UsController {

    @GetMapping("/getInfo")
    public BaseResp getInfo(){
        return BaseResp.success(new Us().selectOne(new QueryWrapper<Us>().last("limit 0,1")));
    }
}
