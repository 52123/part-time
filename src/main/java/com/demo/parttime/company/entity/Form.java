package com.demo.parttime.company.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("entry_form")
public class Form extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 兼职id
     */
    private Integer pId;

    /**
     * 报报名状态，0-已成功投递，1-已查看，2-待面试，3-录用，4-拒绝
     */
    private Integer status;

    /**
     *  索引，userId _pId
     */
    @TableId( type = IdType.AUTO)
    private String id;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
