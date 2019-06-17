package com.mqiy.mapper;

import java.util.List;

import com.mqiy.command.OrderCommand;

public interface OrderMapper {

	OrderCommand findOrderUser(Integer orderId);

	List<OrderCommand> findOrderInfo();
	
	OrderCommand findOrdersUserLazyLoading(Integer orderId);

}
