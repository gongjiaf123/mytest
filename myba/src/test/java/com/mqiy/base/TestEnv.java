package com.mqiy.base;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.mqiy.mapper.UserMapper;
import com.mqiy.model.User;
import com.mqiy.util.DbUtil;

public class TestEnv {

	private static SqlSession sqlSession;

	@Before
	public void init() {
		sqlSession = DbUtil.getFactory().openSession();
	}

	@Test
	public void selectOne() {
		User user = sqlSession.selectOne("findUserById", 1);
		System.out.println(user.getUsername());
		sqlSession.close();
	}

	@Test
	public void selectList() {
		List<User> users = sqlSession.selectList("findUserByName", "o");
		for (User u : users) {
			System.out.println(u.getUsername());
		}
	}

	@Test
	public void insert() {
		User u = new User();
		u.setUsername("dahui");
		u.setAddress("永和二村");

		sqlSession.insert("insertUser", u);

		System.out.println(u.getId());
		sqlSession.commit();
	}

	@Test
	public void delete() {
		sqlSession.delete("deleteUser", 6);
		sqlSession.commit();
	}

	@Test
	public void update() {
		User u = sqlSession.selectOne("findUserById", 1);
		System.out.println(u.getUsername());
		u.setUsername("mqiy");
		sqlSession.update("updateUser", u);
		sqlSession.commit();
	}

	@Test
	public void Cache() {
		SqlSession session1 = DbUtil.getFactory().openSession();
		SqlSession session2 = DbUtil.getFactory().openSession();

		User u1 = session1.getMapper(UserMapper.class).findUserById(1);
		System.out.println(u1);
		//这里执行关闭操作，将sqlsession中的数据写到二级缓存区域
		session1.close();

		User u2 = session2.getMapper(UserMapper.class).findUserById(1);
		System.out.println(u2);
		session2.close();

	}

	@After
	public void end() {
		sqlSession.close();
	}

}
