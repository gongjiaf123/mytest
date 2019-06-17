package com.mqiy.mapper;

import java.util.List;

import com.mqiy.condition.UserLoginLogCondition;
import com.mqiy.model.UserLoginLog;

public interface UserLoginLogMapper {

	UserLoginLog findByUserId(Integer userId);

	List<UserLoginLog> findByCondition(UserLoginLogCondition condition);
}
