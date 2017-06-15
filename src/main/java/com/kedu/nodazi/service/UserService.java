package com.kedu.nodazi.service;

import java.util.List;

import com.kedu.nodazi.dto.LoginDto;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.UserDto;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.service
 * UserService.java
 * </pre>
 * @author	: 안홍내
 * @Date	: 2017. 6. 15.
 * @Version	: 
 *****************************************************/
public interface UserService {
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : join
	 * @param udto
	 * @throws Exception
	 *****************************************************/
	public void join(UserDto udto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : login
	 * @param ldto
	 * @return
	 * @throws Exception
	 *****************************************************/
	public UserDto login(LoginDto ldto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : payment
	 * @param pdto
	 * @throws Exception
	 *****************************************************/
	public void payment(PaymentDto pdto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : info
	 * @param u_id
	 * @return
	 * @throws Exception
	 *****************************************************/
	public UserDto info(String u_id)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : paymentDetail
	 * @param u_id
	 * @return
	 * @throws Exception
	 *****************************************************/
	public List<PaymentDto> paymentDetail(String u_id)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : userUpdate
	 * @param udto
	 * @throws Exception
	 *****************************************************/
	public void userUpdate(UserDto udto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : withdraw
	 * @param udto
	 * @throws Exception
	 *****************************************************/
	public void withdraw(UserDto udto)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : overlap
	 * @param u_id
	 * @return
	 * @throws Exception
	 *****************************************************/
	public String overlap(String u_id)throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : loginCheck
	 * @param u_id
	 * @return
	 * @throws Exception
	 *****************************************************/
	public String loginCheck(String u_id) throws Exception;
}
