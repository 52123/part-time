package com.demo.parttime.utils.search;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * @author 52123
 * @since 2019/5/15 1:10
 */
@Data
public class LuceneResult{

    private String code = "0000";

    private String msg;

    private Long totalHits;

    private List<Map<String,String>> data;

    public LuceneResult success() {
        this.msg = "检索成功";
        return this;
    }

    public LuceneResult fail(String msg){
        this.msg = msg;
        this.code = "0002";
        return this;
    }
}

