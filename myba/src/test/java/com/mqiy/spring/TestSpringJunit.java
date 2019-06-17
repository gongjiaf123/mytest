package com.mqiy.spring;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.mqiy.model.User;
import com.mqiy.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)  
@TransactionConfiguration(transactionManager = "txManager", defaultRollback = false)  
@Transactional 
@ContextConfiguration(locations={"classpath:applicationContext.xml"}) 
public class TestSpringJunit {
	
	private static final Logger logger = LoggerFactory.getLogger(TestSpringJunit.class);
	
	@Autowired
	private UserService userService;
	
	@Test
	public void findUserById(){
		User u = userService.findUserById(1);
		logger.debug(u.getUsername());
	}

	@Test
	public void deleteUser(){
		userService.deleteUser(29);
		logger.debug("删除成功");
	}

	@Test
	public void insertUser(){
		User u = new User();
		u.setUsername("swdfwefweeeeee8");
		userService.insertUser(u);
		logger.debug("用户创建成功");
		
	}
}
