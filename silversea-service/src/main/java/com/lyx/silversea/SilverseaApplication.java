package com.lyx.silversea;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ComponentScan("com.lyx.silversea.*")
@MapperScan(basePackages = "com.lyx.silversea.dao.*")
//@EnableScheduling //允许定时任务
//@EnableAsync //允许异步
public class SilverseaApplication {

    public static void main(String[] args) {
        SpringApplication.run(SilverseaApplication.class, args);
    }
}
