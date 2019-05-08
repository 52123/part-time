package com.demo.parttime;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

/**
 * @author huangzhiqiang
 */
@MapperScan("com.demo.parttime.*.mapper")
@SpringBootApplication
public class PartTimeApplication {

    public static void main(String[] args) {
        SpringApplication.run(PartTimeApplication.class, args);
        System.out.println("\n"+

                "   \n"+
                "　　　┏┓　　　┏┓         \n"+
                "　　┏┛┻━━━┛┻┓              \n"+
                "　  ┃　　　　　　　┃     \n"+
                "　  ┃　　　━　　　┃     \n"+
                "　  ┃　┳┛　┗┳  ┃  \n"+
                "　　┃　　　　　　　┃  \n"+
                "　　┃　　　┻　　　┃  \n"+
                "　　┃　　　　　　　┃  \n"+
                "　　┗━┓　　　┏━┛  \n"+
                "　　　　┃　　　┃      \n"+
                "　　　　┃　　　┃  \n"+
                "　　　　┃　　　┗━━━┓  \n"+
                "　　　　┃   神兽保佑　 ┣┓  \n"+
                "　　　　┃　　52123　   ┏┛  \n"+
                "　　　　┗┓┓┏━┳┓┏┛  \n"+
                "　　　　　┃┫┫　┃┫┫  \n"+
                "　　　　　┗┻┛　┗┻┛  \n"

        );
    }

}
