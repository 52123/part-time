package com.demo.parttime.util;

import lombok.Data;

@Data
public class BaseResp<T> {

    private String resultCode = "0000";

    private String message;

    private T data = null;

    public static <T> BaseResp success(T data){
        BaseResp<T> baseResp = new BaseResp<>();
        baseResp.setData(data);
        return baseResp;
    }

    public static <T> BaseResp success(){
        return new BaseResp<T>();
    }

    public static BaseResp fail(String resultCode , String message){
        BaseResp baseResp = new BaseResp<>();
        baseResp.setMessage(message);
        baseResp.setResultCode(resultCode);
        return baseResp;
    }

    public static BaseResp unlogin(){
        BaseResp baseResp = new BaseResp<>();
        baseResp.setMessage("请先登录");
        baseResp.setResultCode("501");
        return baseResp;
    }

    public static BaseResp badArgument(){
        BaseResp baseResp = new BaseResp<>();
        baseResp.setMessage("参数值有误");
        baseResp.setResultCode("502");
        return baseResp;
    }

    public static BaseResp fail(){
        BaseResp baseResp = new BaseResp<>();
        baseResp.setMessage("服务器内部有误");
        baseResp.setResultCode("500");
        return baseResp;
    }
}
