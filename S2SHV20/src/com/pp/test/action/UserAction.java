package com.pp.test.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.pp.test.bo.User;
import com.pp.test.service.IUserService;

public class UserAction {
    	
	private IUserService userService;
    	
	
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String execute() throws Exception {
		System.out.println("开始");
		user = new User();
		user.setAddress("你");
		user.setAge(25);
		user.setSex("男");
		user.setUserName("我");
		
		ActionContext context = ActionContext.getContext();
		Map session=context.getSession();
		session.put("USER_NAME", "zhangwei");
		//this.userService.addUser(user);
		return "success";
	}

	public void setUserService(IUserService userService) {
	    this.userService = userService;
	}
}
