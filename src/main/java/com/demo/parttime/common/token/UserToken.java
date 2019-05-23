package com.demo.parttime.common;

import com.demo.parttime.wx.entity.User;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @author 52123
 * @since 2019/4/5 10:06
 */
@Data
public class UserToken {

    private LocalDateTime expireTime;

    private User user;

    private String token;

    UserToken(User user, Integer second) {
        this.user = user;
        this.expireTime = LocalDateTime.now().plusSeconds(second);
    }

    public void resetExpireTime(Integer second){
        this.expireTime = LocalDateTime.now().plusSeconds(second);
    }
}
