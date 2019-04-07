package com.demo.parttime.wx.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class User extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;

    private String openId;

    private String userId;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 头像
     */
    private String avatarUrl;

    /**
     * 性别
     */
    private Integer gender;

    private String city;

    private String province;

    private String unionId;

    /**
     * 信誉
     */
    private Integer credit;

    /**
     * 0-用户，1-发布者
     */
    private Integer category;

    private String sessionKey;

    public User(){}

    @Override
    protected Serializable pkVal() {
        return id;
    }

    /**
     *  存入openid
     */
    public User(String userId, String openId, String unionId, String sessionKey){
        this.userId = userId;
        this.openId = openId;
        this.unionId = unionId;
        this.sessionKey = sessionKey;
    }
    
}
