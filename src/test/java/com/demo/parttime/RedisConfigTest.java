package com.demo.parttime;

import com.alibaba.fastjson.JSONObject;
import com.demo.parttime.company.entity.Pinfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.Serializable;

/**
 * @author 52123
 * @since 2019/5/7 17:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = PartTimeApplication.class)
public class RedisConfigTest {

    @Autowired
    private RedisTemplate<String, ? extends Serializable> redisTemplate;

    @Test
    public void test(){
        Pinfo pinfo = new Pinfo();
        pinfo.setAddress("sadad");
        ValueOperations<String,? extends Serializable> opsForValue =  redisTemplate.opsForValue();
        opsForValue.append("pinfo", JSONObject.toJSONString(pinfo));
    }
}
