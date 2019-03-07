package com.spring.docker.model.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author panxin
 */
@Data
public class HelloRequestDTO implements Serializable {

    private static final long serialVersionUID = 6833459289027501106L;

    private Long id;

}
