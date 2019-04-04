package com.demo.parttime;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author huangzhiqiang
 */
@MapperScan("com.demo.parttime.*.mapper")
@SpringBootApplication
public class PartTimeApplication {

    public static void main(String[] args) {
        SpringApplication.run(PartTimeApplication.class, args);
    }

}
