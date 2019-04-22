package com.demo.parttime.wx.entity;

import java.io.Serializable;

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
 * @since 2019-04-22
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Collect extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 索引，userId + pId
     */
    @TableId
    private String id;

    private Integer userId;

    private Integer pId;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
