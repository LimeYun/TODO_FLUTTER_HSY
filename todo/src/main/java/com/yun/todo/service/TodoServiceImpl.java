package com.yun.todo.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yun.todo.domain.Todos;
import com.yun.todo.mapper.TodoMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TodoServiceImpl implements TodoService {

    private static final String KAKAO_API_URL = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
    private static final String ACCESS_TOKEN = "9lGu14-CrwVfoQvhF0GS0TVUdzUKC7LMAAAAAQo9cxgAAAGVDn7m37bGP5Eb7W-4";
    
    @Autowired
    private TodoMapper todoMapper;


    @Override
    public List<Todos> list() {
        return todoMapper.list();
    }

    @Override
    public boolean insert(Todos todos) {
        return todoMapper.insert(todos) > 0;
    }

    @Override
    public Todos select(Long no) {
        return todoMapper.select(no);
    }

    @Override
    public Todos selectById(String id) {
        return todoMapper.selectById(id);
    }

    @Override
    public boolean updateById(Todos todos) {
        return todoMapper.updateById(todos) > 0;
    }

    @Override
    public boolean deleteById(String id) {
        return todoMapper.deleteById(id) > 0;
    }

    @Override
    public List<Todos> findByTodosDate(String date) {
        return todoMapper.findByTodoDate(date); 
    }


//     @Override
//     public String generateTodoMessage() {
//         List<Todos> todayTodos = finbByTodosDate();

//         log.info("할일 데이터 : " + todayTodos);
        
//         if (todayTodos.isEmpty()) {
//             return "오늘의 할일이 없습니다.";
//         }
        
//         return todayTodos.stream()
//             .map(todo -> "- " + todo.getName())
//             .collect(Collectors.joining("\n", "오늘의 할일:\n", ""));
//     }

//     @Override
//     @Scheduled(cron = "0 0 0 * * ?")
//     public void sendTodayTodos() {
//         String messageBody = generateTodoMessage();
//         log.info("sendTodayTodos 메서드 실행");
//         log.info("메세지 내용 확인 : " + messageBody);
        
//         sendKakaoMessage(messageBody);
//     }
    
//     private void sendKakaoMessage(String message) {
//     try {
//         RestTemplate restTemplate = new RestTemplate();
//         HttpHeaders headers = new HttpHeaders();
//         headers.set("Authorization", "Bearer " + ACCESS_TOKEN);
//         headers.set("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

//         Map<String, Object> templateObject = new HashMap<>();
//         templateObject.put("object_type", "text");
//         templateObject.put("text", message);

//         Map<String, String> link = new HashMap<>();
//         link.put("web_url", "http://localhost:5173");
//         templateObject.put("link", link);

//         ObjectMapper objectMapper = new ObjectMapper();
//         String templateJson = objectMapper.writeValueAsString(templateObject);

//         MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//         body.add("template_object", templateJson);

//         HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);

//         ResponseEntity<String> response = restTemplate.exchange(KAKAO_API_URL, HttpMethod.POST, request, String.class);

//         log.info("카카오 API 응답 코드 : " + response.getStatusCodeValue());
//         log.info("카카오 API 응답 본문 : " + response.getBody());

//     } catch (Exception e) {
//         log.error("카카오톡 메시지 전송 실패!", e);
//     }
// }

}
