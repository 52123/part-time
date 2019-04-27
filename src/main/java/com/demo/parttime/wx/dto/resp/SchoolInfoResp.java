package com.demo.parttime.wx.dto.resp;

import lombok.Data;

import java.util.List;

/**
 * @author 52123
 * @since 2019/4/28 3:00
 */
@Data
public class SchoolInfoResp {

    private List<String> college;

    private String school;

    private List<Integer> grade;
}
