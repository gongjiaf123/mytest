package com.mqiy.service;

import java.util.List;

import com.mqiy.condition.UserCondition;
import com.mqiy.model.User;

public interface UserService {

	User findUserById(int id);

	List<User> findUserByName(String name);

	List<User> findUserByUserCommand(UserCondition condition);

	void insertUser(User user);

	void deleteUser(int id);

	void updateUser(User user);

	int countByUserCommand(UserCondition command);
}
