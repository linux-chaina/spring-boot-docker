package com.spring.docker;

import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author panxin
 */
@SpringBootTest(classes = BaseTestConfiguration.class)
@ActiveProfiles("unittest")
@RunWith(SpringRunner.class)
public class BaseTest {

}
