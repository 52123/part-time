package com.demo.parttime.company.entity;

import java.time.LocalDateTime;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("p_info")
public class Pinfo extends Model implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private int id;

    /**
     * 所属公司
     */
    private Integer companyId;

    /**
     * 名称
     */
    private String title;

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
    private Integer longTerm;

    /**
     * 薪资
     */
    private String salary;

    /**
     * 面议， 0-不是，1-是
     */
    private Integer discuss;

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
    private Integer needInterview;

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
    private String contactNumber;

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

    /**
     *  过期时间
     */
    private LocalDateTime expireTime;

    /**
     *  公司名称
     */
    private String companyName;

    @Override
    protected Serializable pkVal() {
        return id;
    }
}
