package com.demo.parttime.company.entity;

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
 * @since 2019-04-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Classify extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId( type = IdType.AUTO)
    private Integer id;

    /**
     * 类目
     */
    private String category;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
