package com.demo.parttime.company.annotation;

import java.lang.annotation.*;

/**
 * @author 52123
 * @since 2019/5/7 19:32
 *  根据方法的第一个参数对象的所有非空属性作为redisKey
 *  传入的key为空则直接拼接对象的所有非空属性值
 *  不为空则替换{} 为 对应的对象属性
 *  当readObject为false时，用key的值作为redisKey
 *  用法一  @ObjectCacheable(key = "redisKey:{}:{}", fields ={"name","age"}) --> redisKey:Hugh:12
 *          若name为null， 则结果为 redisKey:12
 *  用法二  @ObjectCacheable(fields ={"name","age"})  -->  Hugh:12
 *  用法三  @ObjectCacheable(key = "redisKey"，readObject = false)   -->  redisKey
 *  用法四  @ObjectCacheable   自动获取方法第一个对象的非空属性作为redisKey  -->  Hugh:12
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ObjectCacheable {

    String key() default "";

    String[] fields() default {};

    boolean readObject() default true;
}
