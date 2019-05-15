package com.demo.parttime.company.dto.resp;

import com.demo.parttime.util.WebResp;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author 52123
 * @since 2019/4/14 23:22
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PartTimeSectionResp{

    private int id;

    /**
     * 名称
     */
    private String title;


    /**
     * 区域地址
     */
    private String address;

    /**
     * 薪资
     */
    private Integer salary;

    /**
     *  公司名
     */
    private String companyName;

    /**
     *  是否为长期
     */
    private Integer longTerm;

    /**
     * 创建时间
     */
    private String createTime;

    public void setCreateTimeToString(LocalDateTime createTime){
        // 提前八小时
        this.createTime = createTime.minusHours(8).toString().split("T")[0];
    }

}
