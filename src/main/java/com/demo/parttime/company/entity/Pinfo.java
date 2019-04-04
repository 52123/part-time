package com.demo.parttime.company.entity;

import java.time.LocalDateTime;
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
public class Pinfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 所属公司
     */
    private Integer companyId;

    /**
     * 名称
     */
    private String pName;

    /**
     * 工作内容
     */
    private String jobContent;

    /**
     * 兼职详细地址
     */
    private String detailAddress;

    /**
     * 区域地址
     */
    private String address;

    /**
     * 工作日期
     */
    private String workDate;

    /**
     * 长期兼职，0-不是，1-是
     */
    private String longTerm;

    /**
     * 薪资
     */
    private String salary;

    /**
     * 面议， 0-不是，1-是
     */
    private String discuss;

    /**
     * 要求
     */
    private String requirement;

    /**
     * 工作时间
     */
    private byte[] workTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 需要面试，0-不需要，1-需要
     */
    private String needInterview;

    /**
     * 面试时间
     */
    private String interviewTime;

    /**
     * 面试地点
     */
    private String interviewAddress;

    /**
     * 包餐/车
     */
    private String carterAndBus;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系方式
     */
    private String contactWay;

    /**
     * 咨询群二维码
     */
    private String consultGroup;

    /**
     * 审核，0-未审核，1-已通过，2-不通过，3-已过期
     */
    private Integer status;

    /**
     * 需要人数
     */
    private Integer needPeople;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;


}
