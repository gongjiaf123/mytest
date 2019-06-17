package com.mqiy.condition;

import java.util.Date;
import java.util.List;

public class UserLoginLogCondition {

	private Date loginStartDate;
	
	private Date loginEndDate;
	
	//ip集合
	private List<String> ips;

	public Date getLoginStartDate() {
		return loginStartDate;
	}

	public void setLoginStartDate(Date loginStartDate) {
		this.loginStartDate = loginStartDate;
	}

	public Date getLoginEndDate() {
		return loginEndDate;
	}

	public void setLoginEndDate(Date loginEndDate) {
		this.loginEndDate = loginEndDate;
	}

	public List<String> getIps() {
		return ips;
	}

	public void setIps(List<String> ips) {
		this.ips = ips;
	}
	
}
