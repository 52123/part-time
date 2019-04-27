package com.demo.parttime.company.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.company.dto.req.PartTimeSectionReq;
import com.demo.parttime.company.entity.Classify;
import com.demo.parttime.company.entity.Form;
import com.demo.parttime.company.entity.Pinfo;
import com.demo.parttime.company.service.IFormService;
import com.demo.parttime.company.service.IPinfoService;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.util.WebResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.User;
import org.springframework.beans.factory.annotation.Value;
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

    @Value("${INDEX_SHOW_NUM}")
    private Integer indexShowNum = 8;

    @Value("${LOGIN_SHOW_NUM}")
    private Integer classifyShowNum = 12;

    @PostMapping("/getInfoForIndex")
    public WebResp getInfoForIndex(@RequestBody PartTimeSectionReq req){
        req.setPageSize(indexShowNum);
        return infoService.getPartTimeList(req);
    }

    @PostMapping("/getPartTimeDetail/{id}")
    public BaseResp getPartTimeDetail(@PathVariable("id") Integer id){
        return infoService.getPartTImeDetail(id);
    }

    @PostMapping("/signUp/{id}")
    public BaseResp signUp(@WxUser User user,@PathVariable("id") Integer id){
        return formService.signUp(user.getId(), id);
    }

    @PostMapping("/isSignUp/{id}")
    public BaseResp isSignUp(@WxUser User user, @PathVariable("id") Integer id){
        return new Form().selectOne(new QueryWrapper<Form>()
                .eq("p_id",id).eq("user_id",user.getId())) == null
                ? BaseResp.success(false) : BaseResp.success(true);
    }

    @PostMapping("/partTimeList")
    public WebResp getPartTimeList(@RequestBody PartTimeSectionReq req){
        req.setPageSize(classifyShowNum);
        return infoService.getPartTimeList(req);
    }

    @GetMapping("/getCategory")
    public BaseResp getCategory(){
        return BaseResp.success(new Classify().selectAll());
    }
}
