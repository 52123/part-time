package com.demo.parttime.wx.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class Resume extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 职业
     */
    private Integer profession;

    /**
     * 手机
     */
    private String mobile;

    /**
     * 自我介绍
     */
    private String introduce;

    /**
     * 出生年月
     */
    private String birthDate;

    private String userId;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
