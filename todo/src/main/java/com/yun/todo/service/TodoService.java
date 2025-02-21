package com.yun.todo.service;

import java.util.List;

import com.yun.todo.domain.Todos;

public interface TodoService {

    // 목록
    public List<Todos> list();

    // 등록
    public boolean insert(Todos todos);

    // 조회
    public Todos select(Long no);

    // id로 조회
    public Todos selectById(String id);

    // id로 수정
    public boolean updateById(Todos todos);

    // id로 삭제
    public boolean deleteById(String id);

    // public List<Todos> finbByTodosDate();

    public List<Todos> findByTodosDate(String date);


    // public String generateTodoMessage();

    // public void sendTodayTodos();
}
