package com.demo.parttime.wx.annotation.impl;

import com.demo.parttime.util.UserTokenManager;
import com.demo.parttime.wx.annotation.WxUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
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

    /**
     *  判断 HandlerMethodArgumentResolver 是否支持 MethodParameter(PS: 一般都是通过 参数上面的注解|参数的类型)
     */
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return methodParameter.hasParameterAnnotation(WxUser.class);
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception {
        String token = nativeWebRequest.getHeader("W-Token");
        if(StringUtils.isNotBlank(token)){
            if(UserTokenManager.getUserToken(token) != null){
                return UserTokenManager.getUserToken(token).getUser();
            }
        }
        return null;
    }
}
