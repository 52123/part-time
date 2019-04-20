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
public class PartTimeSectionResp extends WebResp {

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
    private String salary;

    private String companyName;

    /**
     * 创建时间
     */
    private String createTime;

    public void setCreateTime(LocalDateTime createTime){
        // 提前八小时
        this.createTime = createTime.minusHours(8).toString().split("T")[0];
    }

}
