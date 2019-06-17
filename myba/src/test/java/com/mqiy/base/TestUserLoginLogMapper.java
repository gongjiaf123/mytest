package com.mqiy.base;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mqiy.condition.UserLoginLogCondition;
import com.mqiy.mapper.UserLoginLogMapper;
import com.mqiy.model.UserLoginLog;
import com.mqiy.util.DbUtil;

public class TestUserLoginLogMapper {
	
	private static SqlSession sqlSession;
	
	private static UserLoginLogMapper mapper ;
	
	private static final Logger logger = LoggerFactory.getLogger(TestUserLoginLogMapper.class);
	
	@Before
	public  void init(){
		sqlSession = DbUtil.getFactory().openSession();
		mapper = sqlSession.getMapper(UserLoginLogMapper.class);
		
	}
	
	@Test
	public void findByUserId(){
		UserLoginLog log = mapper.findByUserId(3);
		logger.debug(log.getLoginIp());
	}
	
	
	@Test
	public void  findByCondition(){
		
		
		UserLoginLogCondition condition = new UserLoginLogCondition();
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		Date loginStartDate = null;
		Date loginEndDate = null;
		try {
			loginStartDate = df.parse("2016-02-01");
			loginEndDate = df.parse("2016-03-20");
		} catch (ParseException e) {
			e.printStackTrace();
		}

		condition.setLoginStartDate(loginStartDate);
		condition.setLoginEndDate(loginEndDate);
		
		List<String> ips = new ArrayList<String>();
		ips.add("127.0.0.1");
		ips.add("192.168.1.1");
		
		condition.setIps(ips);
		
		List<UserLoginLog> logs = mapper.findByCondition(condition);
		for(UserLoginLog log:logs){
			logger.debug(df.format(log.getLoginDate()));
			logger.debug(log.getLoginIp());
		}
	}
	
	
	
	@After
	public void finish(){
		sqlSession.close();
	}
	

}
