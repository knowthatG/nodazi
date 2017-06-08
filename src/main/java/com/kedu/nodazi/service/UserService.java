package com.kedu.nodazi.service;

import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.UserDto;

public interface UserService {
	public void join(UserDto udto)throws Exception;
	
	public UserDto login(LoginDto ldto)throws Exception;
	
	public void payment(PaymentDto pdto)throws Exception;
	
	public UserDto info(String u_id)throws Exception;
}
