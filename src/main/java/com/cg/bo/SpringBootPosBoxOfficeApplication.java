package com.cg.bo;

import com.cg.bo.properties.FileStorageProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties({
        FileStorageProperties.class
})
public class SpringBootPosBoxOfficeApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootPosBoxOfficeApplication.class, args);
    }

}
