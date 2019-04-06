package com.demo.parttime.wx.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.demo.parttime.util.BaseResp;
import com.demo.parttime.util.UserTokenManager;
import com.demo.parttime.wx.dto.req.WxUserInfoSaveReq;
import com.demo.parttime.wx.dto.resp.WxTokenResp;
import com.demo.parttime.wx.service.IUserService;
import com.demo.parttime.wx.entity.User;
import com.demo.parttime.wx.mapper.UserMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 52123
 * @since 2019-02-19
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Value("${AppID}")
    private String appID;

    @Value("${AppSecret}")
    private String appSecret;

    private Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    /**
     *  保存用户ID
     * @param code 登陆凭证
     * @return 返回处理状态
     */
    @Override
    public BaseResp saveOpenId(String code) {
        String userId = jsCode2SessionInfo(code);
        if(userId == null){
            return BaseResp.fail("503", "登陆凭证有误");
        }
        String token = new UserTokenManager().insertOrUpdateToken(userId);
        WxTokenResp resp = new WxTokenResp(userId, token);
        return BaseResp.success(resp);
    }

    /**
     *  保存或更新微信用户信息
     * @param user 已登录的用户信息
     * @param userDto 传入的用户信息
     */
    @Override
    public BaseResp saveOrUpdateUser(User user, WxUserInfoSaveReq userDto) {
        log.info("saveOrUpdate-->user:{} , userDto:{}",user , userDto);
        user.setAvatarUrl(userDto.getAvatarUrl());
        user.setGender(userDto.getGender());
        user.setNickName(userDto.getNickName());
        user.setCity(userDto.getCity());
        user.setProvince(userDto.getProvince());
        return user.insertOrUpdate() ? BaseResp.success() : BaseResp.fail();
    }

    /**
     *  获取微信用户信誉
     * @param user 登录用户
     * @return BaeResp<Integer credit>
     */
    @Override
    public BaseResp getUserCredit(User user) {
        return BaseResp.success(user.getCredit());
    }

    /**
     * 根据code获取openID并保存
     * @param code 登陆凭证
     * @return String 用户ID
     */
    private String jsCode2SessionInfo(String code) {

        String url = "https://api.weixin.qq.com/sns/jscode2session?appid="+appID+
                "&secret="+appSecret+"&js_code="+code+"&grant_type=authorization_code";
        JSONObject json = getDataFromWX(url);

        String userId = null;
        boolean isSuccess = false;
        User user = null;
        if(json.getInteger("errcode") == 0){
            String openid = json.getString("openid");
            String sessionKey = json.getString("session_key");
            String unionId = json.getString("unionid");
            //todo 将userId放入缓存，命中缓存则跳过下面操作
            userId = DigestUtils.md5DigestAsHex(openid.getBytes());
            user = new User(userId, openid, sessionKey, unionId);
            isSuccess = user.insertOrUpdate();
        }
        log.info("jsCode2SessionInfo()-->url:{}, returnJson:{}, user:{}, insertOrUpdate:{}",
                url, json.toString(), user, isSuccess);

        return userId;
    }

    /**
     *  根据url获取参数
     * @param url 连接微信后台的连接
     * @return 微信后台返回的json字符串
     */
    private JSONObject getDataFromWX(String url){
        StringBuilder result = new StringBuilder();
        BufferedReader br = null;
        try{
            URL jsCode2SessionUrl = new URL(url);
            HttpURLConnection urlConnection = (HttpURLConnection)jsCode2SessionUrl.openConnection();
            urlConnection.connect();
            br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String line;
            while ((line = br.readLine()) != null){
                result.append(line);
            }
        }catch (Exception e){
            log.error("UserServiceImpl-->getDataFromWX: url:{},errorMsg:{}",url,e.getMessage());
        }finally {
            try{
                if(br != null){
                    br.close();
                }
            }catch (Exception e){
                log.error("UserServiceImpl-->getDataFromWX: errorMsg:{}",e.getMessage());
            }
        }

        return JSONObject.parseObject(result.toString());
    }
}
