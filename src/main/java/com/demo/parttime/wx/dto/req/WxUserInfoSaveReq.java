package com.demo.parttime.wx.dto.req;

import lombok.Data;

/**
 * @author huangzhiqiang
 */
@Data
public class WxUserInfoSaveReq {

    private String userId;

    private String nickName;

    private String province;

    private String city;

    private String avatarUrl;

    private Integer gender;
}
