package com.demo.parttime.admin.controller;


import com.demo.parttime.admin.entity.Feedback;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.wx.annotation.WxUser;
import com.demo.parttime.wx.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 52123
 * @since 2019-04-28
 */
@RestController
@RequestMapping("/feedback")
public class FeedbackController {

    @PostMapping("/save")
    public BaseResp saveFeedback(@WxUser User user, @RequestBody Feedback feedback){
        if(StringUtils.isNotBlank(feedback.getSuggest())){
            feedback.setUserId(user.getId());
            return feedback.insert() ? BaseResp.success() : BaseResp.fail();
        }
        return BaseResp.fail();
    }
}
