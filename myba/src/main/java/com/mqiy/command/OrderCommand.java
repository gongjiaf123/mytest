package com.mqiy.command;

import java.util.List;

import com.mqiy.model.Order;
import com.mqiy.model.OrderDetail;
import com.mqiy.model.User;

public class OrderCommand extends Order{
	
	/******* 顾客 ***/
	private User user;
	
	/**** 商品行  ***/
	private List<OrderDetail> details;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrderDetail> getDetails() {
		return details;
	}

	public void setDetails(List<OrderDetail> details) {
		this.details = details;
	}


	
	

}
