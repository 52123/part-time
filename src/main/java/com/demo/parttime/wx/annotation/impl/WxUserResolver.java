package com.demo.parttime.wx.annotation.impl;

import com.demo.parttime.util.UserTokenManager;
import com.demo.parttime.wx.annotation.WxUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.annotation.Resource;


/**
 * @author huangzhiqiang
 */
@Component
public class WxUserResolver implements HandlerMethodArgumentResolver {

    @Resource
    private UserTokenManager userTokenManager;

    /**
     *  判断 HandlerMethodArgumentResolver 是否支持 MethodParameter(PS: 一般都是通过 参数上面的注解|参数的类型)
     */
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.hasParameterAnnotation(WxUser.class);
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) {
        String token = nativeWebRequest.getHeader("W-Token");
        if(StringUtils.isNotBlank(token)){
            return userTokenManager.getUser(token);
        }
        return null;
    }
}
