package com.mqiy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mqiy.condition.UserCondition;
import com.mqiy.mapper.UserMapper;
import com.mqiy.model.User;
import com.mqiy.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public User findUserById(int id) {
		return userMapper.findUserById(id);
	}

	@Override
	public List<User> findUserByName(String name) {
		return userMapper.findUserByName(name);
	}

	@Override
	public List<User> findUserByUserCommand(UserCondition condition) {
		return userMapper.findUserByUserCommand(condition);
	}

	@Override
	public void insertUser(User user) {
		userMapper.insertUser(user);

	}

	@Override
	public void deleteUser(int id) {
		userMapper.deleteUser(id);

	}

	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);

	}

	@Override
	public int countByUserCommand(UserCondition command) {
		return userMapper.countByUserCommand(command);
	}

}
