package com.demo.parttime.common.filter;

import com.alibaba.fastjson.JSON;
import com.demo.parttime.common.model.BaseResp;
import com.demo.parttime.common.token.UserTokenManager;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 52123
 * @since 2019/4/6 12:09
 */
@Component
public class Filter implements HandlerInterceptor {

    private final String[] UNLOGIN_URI = {"/user/json2CodeSession",
            "/swiper/getSwiper","/p-info/getInfoForIndex","/error"};


    @Resource
    private UserTokenManager userTokenManager;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getServletPath();
        for (String unLoginUri : UNLOGIN_URI) {
            if (unLoginUri.equals(uri) || ( uri.length() >= 8 && "/static/".equals(uri.substring(0,8)))) {
                return true;
            }
        }
        String token = request.getHeader("W-Token");
        if (userTokenManager.isExpire(token)) {
            response.setContentType("application/json;Charset=UTF-8");
            String json = JSON.toJSONString(BaseResp.unlogin());
            ServletOutputStream os = response.getOutputStream();
            os.write(json.getBytes());
            os.flush();
            os.close();
            return false;
        }

        return true;
    }
}
