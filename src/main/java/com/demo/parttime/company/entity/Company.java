package com.demo.parttime.company.entity;

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
public class Company implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 公司名称
     */
    private String name;

    /**
     * 相关负责人
     */
    private String leadingOfficial;

    /**
     * 联系电话
     */
    private String mobile;

    /**
     * 公司地址
     */
    private String address;

    /**
     * 备注
     */
    private String remark;

    /**
     * 信誉
     */
    private Integer credit;


}
