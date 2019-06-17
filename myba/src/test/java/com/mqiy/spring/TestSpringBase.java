package com.mqiy.spring;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mqiy.mapper.UserMapper;
import com.mqiy.model.User;

public class TestSpringBase {

	private static final Logger logger = LoggerFactory.getLogger(TestSpringBase.class);

	private ApplicationContext act;
	
	@Before
	public void init(){
		act = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	}
	
	
	@Test
	public void findUserById(){
		UserMapper mapper = (UserMapper) act.getBean("userMapper");
		User u = mapper.findUserById(1);
		logger.debug(u.getUsername());
	}
	
	
}
