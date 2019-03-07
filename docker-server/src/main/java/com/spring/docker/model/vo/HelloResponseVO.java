package com.spring.docker.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author panxin
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class HelloResponseVO implements Serializable {

    private static final long serialVersionUID = 8672989692298004748L;

    private Long id;

    private String name;

}
