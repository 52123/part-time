package com.demo.parttime.wx.dto.resp;

import lombok.Data;

/**
 * @author 52123
 * @since 2019/4/5 19:28
 */
@Data
public class WxTokenResp {

    private String userId;

    private String token;

    public WxTokenResp(String userId, String token){
        this.userId = userId;
        this.token = token;
    }

}
