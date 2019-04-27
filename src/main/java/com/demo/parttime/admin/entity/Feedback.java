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
 * @since 2019-04-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Feedback  extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId( type = IdType.AUTO )
    private Integer id;

    private String suggest;

    private String name;

    private String contact;

    private Integer userId;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
