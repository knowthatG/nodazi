package com.kedu.nodazi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.nodazi.dao.UserDao;
import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.UserDto;

@Service

public class UserServiceImpl implements UserService{

	@Inject
	private UserDao udao;
	
	@Override
	public void join(UserDto udto)throws Exception{
		udao.regist(udto);
	}
	
	@Override
	public UserDto login(LoginDto ldto)throws Exception{
		return udao.login(ldto);
	}
	
	@Override
	public void payment(PaymentDto pdto)throws Exception{
		udao.payment(pdto);
	}
	
	@Override
	public UserDto info(String u_id)throws Exception{
		return udao.info(u_id);
	}
	
	@Override
	public List<PaymentDto> payment(String u_id)throws Exception{
		return udao.payment(u_id);
	}
	
	@Override
	public void userUpdate(UserDto udto)throws Exception{
		udao.userUpdate(udto);
	}
	
	@Override
	public void withdraw(UserDto udto)throws Exception{
		udao.withdraw(udto);
	}
	
	@Override
	public UserDto overlap(UserDto udto)throws Exception{
		return udao.overlap(udto);
	}
}
