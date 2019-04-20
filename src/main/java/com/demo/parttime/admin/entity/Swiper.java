package com.demo.parttime.admin.entity;

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
 * @since 2019-04-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Swiper extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId( type = IdType.AUTO)
    private int id;

    /**
     * 图片地址
     */
    private String url;

    /**
     * 发布者id
     */
    private Integer companyId;

    /**
     * 兼职id
     */
    private Integer pId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 类型，0-发布者，1-兼职信息，2-用户id
     */
    private Integer species;

    private String type;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
