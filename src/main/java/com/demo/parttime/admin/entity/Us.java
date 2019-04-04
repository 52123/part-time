package com.demo.parttime.admin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
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
@TableName("about_us")
public class Us implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 地址
     */
    private String address;

    /**
     * 联系电话
     */
    private String mobile;


}
