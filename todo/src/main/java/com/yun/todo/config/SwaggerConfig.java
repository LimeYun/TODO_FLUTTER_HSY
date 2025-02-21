package com.yun.todo.config;

import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;

@Configuration
public class SwaggerConfig {
    
    @Bean
    public GroupedOpenApi publicApi() {
        return GroupedOpenApi.builder()
                    .group("yun")
                    .pathsToMatch("/**")
                    .build();
    }

    @Bean
    public OpenAPI todoCalendarOpenAPI() {
        return new OpenAPI()
                    .info(new Info().title("TodoCalendar Project API")
                                    .description("Clush 채용 과제 API 입니다.")
                                    .version("v0.0.1"));
    }
}
