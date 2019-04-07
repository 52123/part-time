package com.demo.parttime.filter;

import com.alibaba.fastjson.JSON;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.util.UserTokenManager;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * @author 52123
 * @since 2019/4/6 12:09
 */
@Component
public class LoginFilter implements HandlerInterceptor {

    private final static String LOGIN_URI = "/user/json2CodeSession";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        if(!LOGIN_URI.equals(uri)){
            String token = request.getHeader("W-Token");
            if(UserTokenManager.isExpire(token)){
                response.setContentType("application/json;Charset=UTF-8");
                String json = JSON.toJSONString(BaseResp.unlogin());
                PrintWriter writer = response.getWriter();
                writer.write(json);
                writer.flush();
                writer.close();
                return true;
            }
        }
        return false;
    }
}
