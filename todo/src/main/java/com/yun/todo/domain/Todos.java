package com.yun.todo.domain;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Todos {

    private Long no;
    private String id;
    private String name;
    private Boolean status;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date todoDate;
    
}
