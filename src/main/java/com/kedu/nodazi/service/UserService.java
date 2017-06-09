package com.kedu.nodazi.service;

import java.util.List;

import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.UserDto;

public interface UserService {
	public void join(UserDto udto)throws Exception;
	
	public UserDto login(LoginDto ldto)throws Exception;
	
	public void payment(PaymentDto pdto)throws Exception;
	
	public UserDto info(String u_id)throws Exception;
	
	public List<PaymentDto> payment(String u_id)throws Exception;
	
	public void userUpdate(UserDto udto)throws Exception;
}
