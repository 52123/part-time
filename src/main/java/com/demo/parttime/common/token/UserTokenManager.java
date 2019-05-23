package com.demo.parttime.common.token;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.demo.parttime.wx.entity.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.concurrent.TimeUnit;


/**
 * @author 52123
 * @since 2019/4/5 9:58
 */
@Component("userTokenManager")
public class UserTokenManager {

    @Value("${expireTime_wx}")
    private Long second;

    @Resource
    private RedisTemplate<String,Object> redisTemplate;

    private String prefixKey = "user:token:";

    /**
     *  当前用户token是否还有效
     * @param token 前端传入的token
     * @return boolean
     */
    public boolean isExpire(String token){
        String redisKey = prefixKey + token;
        if(redisTemplate.hasKey(redisKey)){
            redisTemplate.expire(redisKey, second, TimeUnit.SECONDS);
            return false;
        }
        return true;
    }

    public User getUser(String token){
        return (User)redisTemplate.opsForValue().get(prefixKey + token);
    }

    /**
     *  创建token并放入缓存中
     * @param userId 用户ID
     */
    public String insert(String userId){
        String token = generateToken(userId);
        String redisKey = prefixKey + token;
        User user = (User)new User().selectOne(new QueryWrapper<User>().eq("user_id",userId));
        redisTemplate.opsForValue().set(redisKey, user);
        redisTemplate.expire(redisKey, 30, TimeUnit.SECONDS);
        return token;
    }

    /**
     * 生成token
     * @param userId 根据用户ID加时间生成token
     * @return token
     */
    private String generateToken(String userId){
        return DigestUtils.md5DigestAsHex((userId + LocalDateTime.now()).getBytes());
    }

}
