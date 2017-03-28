package com.interview.users.service;

import com.interview.users.domain.User;

public interface UserService {
	public User getUser();
	public User getUser(int idx);
	public User getUser(String userId, String password);
	public User getUser(String userId);
	public int updateUser(User user);
	public int insertUser(User user);
	public int deleteUser(User user);
}
