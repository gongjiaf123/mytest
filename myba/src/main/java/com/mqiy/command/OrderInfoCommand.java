package com.mqiy.command;

import java.util.List;

import com.mqiy.model.Order;

public class OrderInfoCommand extends Order{
	
	private List<OrderDetailCommand> details;

	public List<OrderDetailCommand> getDetails() {
		return details;
	}

	public void setDetails(List<OrderDetailCommand> details) {
		this.details = details;
	}
	
	

}
