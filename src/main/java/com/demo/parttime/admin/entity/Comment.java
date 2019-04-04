package com.demo.parttime.admin.entity;

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
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 兼职信息id
     */
    private Integer pId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 公司id
     */
    private Integer companyId;

    /**
     * 公司对用户的评价
     */
    private String toUser;

    /**
     * 用户对公司的评价
     */
    private String toCompany;

    /**
     * 公司对用户的打分
     */
    private Integer toUserCredit;

    /**
     * 用户对公司的打分
     */
    private Integer toCompanyCredit;

    /**
     * 公司评价审核状态 0-未审核，1-审核通过，2-不通过
     */
    private Integer companyStatus;

    /**
     * 用户评价审核状态 0-未审核， 1-审核通过 2-不通过
     */
    private Integer userStatus;


}
