package com.spring.docker.controller;

import com.spring.docker.BaseTest;
import com.spring.docker.model.vo.HelloResponseVO;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author panxin
 */
public class HelloControllerTest extends BaseTest {

    @Autowired
    private HelloController helloController;

    @Test
    public void testHelloName() {
        String resp = helloController.helloName("fff");
        Assert.assertNotNull(resp);
    }

    @Test
    public void testHelloId() {
        HelloResponseVO resp = helloController.hello(111L);
        Assert.assertNotNull(resp);
        Assert.assertNotNull(resp.getId());
        Assert.assertEquals(resp.getId().longValue(), 111);
    }

}
