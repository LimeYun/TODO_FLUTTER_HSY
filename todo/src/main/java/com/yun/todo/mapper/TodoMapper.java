package com.yun.todo.mapper;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.yun.todo.domain.Todos;

@Mapper
public interface TodoMapper {

    // 목록
    public List<Todos> list();

    // 등록
    public int insert(Todos todos);

    // 조회
    public Todos select(Long no);

    // id로 조회
    public Todos selectById(String id);

    // id로 수정
    public int updateById(Todos todos);

    // id로 삭제
    public int deleteById(String id);

    public List<Todos> findByTodoDate(@Param("date") String date);
}
