package com.interview.users.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.interview.users.dao.UserDao;
import com.interview.users.domain.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
	 
	@Override
	public User getUser() {
		return sqlSession.selectOne("getUser");
	}
	
	@Override
	public User getUser(int idx) {
		HashMap param = new HashMap();
		param.put("idx", idx);
		return sqlSession.selectOne("getUser", param);
	}
	
	@Override
	public User getUser(String userId) {
		HashMap param = new HashMap();
		param.put("userId", userId);
		
		return sqlSession.selectOne("getUser", param);
	}

	@Override
	public User getUser(String userId, String password) {
		HashMap param = new HashMap();
		param.put("userId", userId);
		param.put("password", password);
		return sqlSession.selectOne("getUser", param);
	}

	@Override
	public int updateUser(User user) {
		return sqlSession.update("updateUser", user);
	}

	@Override
	public int insertUser(User user) {
		return sqlSession.insert("insertUser", user);
	}

	@Override
	public int deleteUser(User user) {
		return sqlSession.delete("deleteUser", user);
	}

}
