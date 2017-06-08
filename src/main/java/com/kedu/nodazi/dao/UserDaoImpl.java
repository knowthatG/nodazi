package com.kedu.nodazi.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.UserDto;
@Repository
public class UserDaoImpl implements UserDao{
	
	@Inject
	private SqlSession session;
	
	private static String namespace 
	="com.kedu.nodazi.mapper.UserMapper";
	
	public void regist(UserDto udto)throws Exception{
		session.insert(namespace+".regist",udto);
	}
	
	public UserDto login(LoginDto ldto) throws Exception{
		return session.selectOne(namespace + ".login",ldto);
	}
	public void payment(PaymentDto pdto)throws Exception{
		 session.insert(namespace+".payment",pdto);
	}
	
	public UserDto info(String u_id)throws Exception{
		return session.selectOne(namespace + ".info",u_id);
	}
}
