package com.yhsx;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EntityScan("com.yhsx.model")
@MapperScan({"com.yhsx.mapper","com.yhsx.dao"})
public class YhsxwebApplication {

    public static void main(String[] args) {
        SpringApplication.run(YhsxwebApplication.class, args);
    }



}
