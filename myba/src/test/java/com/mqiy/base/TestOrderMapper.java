package com.mqiy.base;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mqiy.command.OrderCommand;
import com.mqiy.mapper.OrderMapper;
import com.mqiy.util.DbUtil;

public class TestOrderMapper {

	private static SqlSession sqlSession;

	private static OrderMapper mapper;

	private static final Logger logger = LoggerFactory.getLogger(TestOrderMapper.class);

	@Before
	public void init() {
		sqlSession = DbUtil.getFactory().openSession();
		mapper = sqlSession.getMapper(OrderMapper.class);
	}

	/** 一对一 **/
	@Test
	public void findOrderUser() {
		OrderCommand command = mapper.findOrderUser(4);
		logger.debug(command.getOrderNo());
		logger.debug(command.getUser().getUsername());
		logger.debug(command.getUser().getAddress());
		logger.debug("商品行数量:" + command.getDetails().size());
	}

	
	
	@Test
	public void findOrdersUserLazyLoading(){
		OrderCommand command = mapper.findOrdersUserLazyLoading(4);
		logger.debug(command.getOrderNo());
		logger.debug(command.getUser().getUsername());
	}
	
	
	@After
	public void finish() {
		sqlSession.close();
	}
}
