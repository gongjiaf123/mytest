package com.mqiy.base;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mqiy.condition.UserCondition;
import com.mqiy.mapper.UserMapper;
import com.mqiy.model.User;
import com.mqiy.util.DbUtil;

public class TestUserMapper {

	private static SqlSession sqlSession;
	
	private static UserMapper mapper ;
	
	private static final Logger logger = LoggerFactory.getLogger(TestUserMapper.class);

	@Before
	public void before() {
		sqlSession = DbUtil.getFactory().openSession();
		mapper = sqlSession.getMapper(UserMapper.class);
	}
	
	
	@Test
	public void findUserById(){
		User u = mapper.findUserById(1);
		logger.debug(u.getUsername());
	}
	
	
	@Test
	public void findUserByUserCommand(){
		
		UserCondition command = new UserCondition();
		command.setSearchName("o");
		command.setSearchAddress("shang");
		
		List<User>  users = mapper.findUserByUserCommand(command);
		for(User u:users){
			System.out.println();
			logger.debug(u.getUsername());
			logger.debug(u.getAddress());
		}
	}
	
	@Test
	public void countByUserCommand(){
		
		UserCondition command = new UserCondition();
		command.setSearchName("%o%");
		logger.debug(mapper.countByUserCommand(command)+"");
	}
	
	
	
	@After
	public void after(){
		sqlSession.close();
	}

}
