package com.demo.parttime.company.controller;


import com.demo.parttime.company.dto.req.PartTimeSectionReq;
import com.demo.parttime.company.service.IPinfoService;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.User;
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
@RequestMapping("/p-info")
public class PInfoController {

    @Resource
    private IPinfoService infoService;

    @PostMapping(value = "/getInfoForIndex",produces = "application/json; charset=utf-8")
    public BaseResp getInfoForIndex(@RequestBody PartTimeSectionReq req){
        return infoService.getInfoForIndex(req);
    }

    @GetMapping("getPartTimeDetail")
    public BaseResp getPartTimeDetail(@RequestParam("id")Integer id){
        return BaseResp.success(infoService.getById(id));
    }
}
