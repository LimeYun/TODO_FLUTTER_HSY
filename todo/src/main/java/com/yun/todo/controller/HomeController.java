package com.yun.todo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HomeController {
    
    @GetMapping("")
    public String getSwaggerDocs() {
        return "redirect:/swagger-ui/index.html";
    }
    
    @GetMapping("/kakao")
    public ResponseEntity<String> kakaoAuthCallback(@RequestParam String code) {
        return ResponseEntity.ok("카카오 인가 코드: " + code);
    }
}
