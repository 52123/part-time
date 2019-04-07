package com.demo.parttime.util;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.wx.entity.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.time.LocalDateTime;
import java.util.HashMap;


/**
 * @author 52123
 * @since 2019/4/5 9:58
 */
@Component
public class UserTokenManager {

    @Value("${expireTime_wx}")
    private Integer second;

    /**
     *  以token为键，UserToken为值
     */
    private static HashMap<String, UserToken>  tokenHashMap = new HashMap<>(512);

    /**
     *  当前用户token是否还有效
     * @param token 前端传入的token
     * @return boolean
     */
    public static boolean isExpire(String token){
        if(tokenHashMap.containsKey(token)){
            UserToken userToken = tokenHashMap.get(token);
            return LocalDateTime.now().isBefore(userToken.getExpireTime());
        }
        return true;
    }

    public static UserToken getUserToken(String token){
        return tokenHashMap.get(token);
    }

    /**
     *  创建token
     * @param userId 用户ID
     */
    public String insertOrUpdateToken(String userId){

        // 查找tokenHashMap中是否已存在token
        String token = hasToken(userId);

        // 若无，新建token
        if(token == null){
            token = generateToken(userId);
            User user = (User)new User().selectOne(new QueryWrapper<User>().eq("user_id",userId));
            UserToken userToken = new UserToken(user,second);
            tokenHashMap.put(token, userToken);
            return token;
        }

        // 若还未过期，增加过期时长
        // 若过期，更换token
        UserToken userToken = tokenHashMap.get(token);
        if(LocalDateTime.now().isBefore(userToken.getExpireTime())){
            userToken.resetExpireTime(second);
        }else{
            tokenHashMap.remove(token);
            token = generateToken(userId);
            tokenHashMap.put(token, userToken);
            userToken.resetExpireTime(second);
        }

        return token;
    }

    /**
     *  检查hashMap里是否已有该用户的token
     * @param userId 用户ID
     */
    private String hasToken(String userId) {
        for(String token : tokenHashMap.keySet()){
            if(token.contains(userId)){
                return token;
            }
        }
        return null;
    }

    /**
     * 生成token
     * @param userId 根据用户ID加时间生成token
     * @return token
     */
    private String generateToken(String userId){
        String clearText = userId + LocalDateTime.now().toString();
        return userId + DigestUtils.md5DigestAsHex(clearText.getBytes());
    }

}
