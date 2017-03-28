package com.interview.users.domain;

public class User {
	private int idx;
	private String userId;
	private String password;
	private String name;
	private String email;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean isSameUser(User user) {
		return isSameUser(user.getUserId());
	}

	public boolean isSameUser(String newUserId) {
		if (userId == null) {
			return false;
		}
		return userId.equals(newUserId);
	}
	
}
