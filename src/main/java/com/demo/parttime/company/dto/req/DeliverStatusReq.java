package com.demo.parttime.company.dto.req;

import com.demo.parttime.util.WebReq;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 52123
 * @since 2019/4/26 18:08
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class DeliverStatusReq extends WebReq {

    private Integer status;

}
