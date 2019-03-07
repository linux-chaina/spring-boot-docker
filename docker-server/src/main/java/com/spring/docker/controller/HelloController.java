package com.spring.docker.controller;

import com.spring.docker.model.dto.HelloRequestDTO;
import com.spring.docker.model.vo.HelloResponseVO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author panxin
 */
@RequestMapping
@RestController
public class HelloController {

    @GetMapping("/api/hello")
    public String helloName(@RequestParam(required = false) String name) {
        name = name == null ? "ddd" : name;
        return "hello " + name;
    }

    @GetMapping("/api/hello/{id}")
    public HelloResponseVO hello(@PathVariable Long id) {
        return HelloResponseVO.builder().id(id).name("hello").build();
    }

    @PostMapping("/api/hello")
    public HelloResponseVO hello(@RequestBody HelloRequestDTO requestDTO) {
        return HelloResponseVO.builder().id(requestDTO.getId()).name("hello dto").build();
    }

}
