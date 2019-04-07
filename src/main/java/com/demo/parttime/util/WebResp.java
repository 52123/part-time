package com.demo.parttime.util;

import lombok.Data;

/**
 * @author 52123
 * @since 2019/4/8 0:58
 */
@Data
public class WebResp {
    private String resultCode = "0000";
    
    private String message;
    
    private Integer pageSize = null;
    
    private Integer pageNum = null;

    public void fail(String resultCode , String message){
        setMessage(message);
        setResultCode(resultCode);
    }

    public void unlogin(){
        setMessage("请先登录");
        setResultCode("501");
    }

    public void badArgument(){
        setMessage("参数值有误");
        setResultCode("502");
    }

    public void fail(){
        setMessage("服务器内部有误");
        setResultCode("500");
    }
}
