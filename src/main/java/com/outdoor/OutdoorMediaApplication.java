package com.outdoor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = "com.outdoor")
@EnableJpaRepositories(basePackages = "com.outdoor.repository")
@EntityScan(basePackages = "com.outdoor.entity")
public class OutdoorMediaApplication extends SpringBootServletInitializer {
    
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(OutdoorMediaApplication.class);
    }
    
    public static void main(String[] args) {
        SpringApplication.run(OutdoorMediaApplication.class, args);
    }
}


