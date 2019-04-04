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
public class Banner implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 轮播图图片
     */
    private String bannerUrl;

    /**
     * 兼职信息图片
     */
    private Integer pId;

    /**
     * 公司图片
     */
    private Integer cId;

    /**
     * 状态，0-在线，1-下线
     */
    private String status;


}
