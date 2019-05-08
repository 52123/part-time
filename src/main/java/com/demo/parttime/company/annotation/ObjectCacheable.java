package com.demo.parttime.company.annotation;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.AliasFor;

import java.lang.annotation.*;

/**
 * @author 52123
 * @since 2019/5/7 19:32
 *  根据方法的第一个参数对象的所有非空属性作为redisKey
 *  传入的key为空则直接拼接对象的所有非空属性值
 *  不为空则替换{} 为 对应的对象属性
 *  例如  @ObjectCacheable(key = "redisKey:{}:{}", fields ={"name","age"}) --> redisKey:Hugh:12
 *          若name为null， 则结果为 redisKey:12:   注意只会删去{}
 *    或  @ObjectCacheable(fields ={"name","age"})  -->  Hugh:12
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ObjectCacheable {

    String key() default "";

    String[] fields() default {};

}
