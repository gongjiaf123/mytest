package com.mqiy.command;

import com.mqiy.model.Item;
import com.mqiy.model.OrderDetail;

public class OrderDetailCommand extends OrderDetail{
	private Item item;

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
	

}
