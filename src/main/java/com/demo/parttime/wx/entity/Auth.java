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
 * @since 2019-04-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Auth extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId( type = IdType.AUTO)
    private Integer id;

    /**
     * 学校名
     */
    private String school;

    /**
     * 学院
     */
    private String college;

    /**
     * 学号
     */
    private Integer studentId;

    /**
     * 年级
     */
    private Integer grade;

    /**
     * 姓名
     */
    private String name;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 状态，0-审核中，1-通过审核，2-拒绝
     */
    private Integer status;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
