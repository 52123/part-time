package com.demo.parttime.wx.dto.resp;

import com.demo.parttime.common.model.WebResp;
import lombok.Getter;
import lombok.Setter;

/**
 * @author 52123
 * @since 2019/4/5 19:28
 */
@Getter
@Setter
public class WxTokenResp extends WebResp {

    private String userId;

    private String token;

    public WxTokenResp(String userId, String token){
        this.userId = userId;
        this.token = token;
    }

    @Override
    public String toString() {
        return "WxTokenResp{" +
                "userId='" + userId + '\'' +
                ", token='" + token + '\'' +
                '}';
    }
}
