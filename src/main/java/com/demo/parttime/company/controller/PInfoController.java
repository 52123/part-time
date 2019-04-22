package com.demo.parttime.company.controller;


import com.demo.parttime.company.dto.req.PartTimeSectionReq;
import com.demo.parttime.company.entity.Form;
import com.demo.parttime.company.service.IFormService;
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

    @Resource
    private IFormService formService;


    @PostMapping("/getInfoForIndex")
    public BaseResp getInfoForIndex(@RequestBody PartTimeSectionReq req){
        return infoService.getInfoForIndex(req);
    }

    @PostMapping("/getPartTimeDetail/{id}")
    public BaseResp getPartTimeDetail(@PathVariable("id") Integer id){
        return BaseResp.success(infoService.getById(id));
    }

    @PostMapping("/signUp/{id}")
    public BaseResp signUp(@WxUser User user,@PathVariable("id") Integer id){
        return formService.signUp(user.getId(), id);
    }

    @PostMapping("/isSignUp/{id}")
    public BaseResp isSignUp(@WxUser User user, @PathVariable("id") Integer id){
        String index = user.getId() + "_" + id;
        return new Form().selectById(index) == null
                ? BaseResp.success(false) : BaseResp.success(true);
    }

}
