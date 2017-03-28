package com.interview.users.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.interview.users.dao.UserDao;
import com.interview.users.domain.User;
import com.interview.users.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource(name="userDao")
	private UserDao userDao;

	@Override
	public User getUser() {
		return userDao.getUser();
	}
	
	@Override
	public User getUser(int idx) {
		return userDao.getUser(idx);
	}
	
	@Override
	public User getUser(String userId) {
		return userDao.getUser(userId);
	}
	
	@Override
	public User getUser(String userId, String password) {
		return userDao.getUser(userId, password);
	}

	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public int deleteUser(User user) {
		return userDao.deleteUser(user);
	}

}
