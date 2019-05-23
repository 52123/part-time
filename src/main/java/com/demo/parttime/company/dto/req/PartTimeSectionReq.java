package com.demo.parttime.company.dto.req;

import com.demo.parttime.common.model.WebReq;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 52123
 * @since 2019/4/14 23:47
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PartTimeSectionReq extends WebReq {

    private String type;

    private String address;

    private String search;

    private Integer categoryId;
}
