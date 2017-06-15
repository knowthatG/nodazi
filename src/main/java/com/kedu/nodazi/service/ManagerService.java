package com.kedu.nodazi.service;

import java.util.List;

import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.dto.UserDto;

public interface ManagerService {
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제 목록
	 * 2. 처리내용	: 결제 목록을 검색조건에 맞게 페이징 처리해서 출력.
	 * </pre>
	 * @Method Name : getPaymentListSearch
	 * @param SearchCriteria
	 * @return List<PaymentDto>
	 * @throws Exception
	 *****************************************************/
	public List<PaymentDto> getPaymentListSearch(SearchCriteria sc) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제 목록 개수
	 * 2. 처리내용	: 페이징을 위해 검색 조건에 맞는 결제 목록의 개수를 가져옴.
	 * </pre>
	 * @Method Name : getPaymentListSearchCount
	 * @param SearchCriteria
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int getPaymentListSearchCount(SearchCriteria sc) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 결제 승인
	 * 2. 처리내용	: 결제 금액에 따라 결제 상태를 갱신
	 * </pre>
	 * @Method Name : confirmPayment
	 * @param List<PaymentDto>
	 * @throws Exception
	 *****************************************************/
	public void confirmPayment(List<PaymentDto> list) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 회원 목록
	 * 2. 처리내용	: 회원 목록을 검색조건에 맞게 페이징 처리해서 출력.
	 * </pre>
	 * @Method Name : getUserListSearch
	 * @param List<UserDto>
	 * @throws Exception
	 *****************************************************/
	public List<UserDto> getUserListSearch(SearchCriteria sc) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 회원 목록 개수
	 * 2. 처리내용	: 페이징을 위해 검색 조건에 맞는 회원 목록의 개수를 가져옴.
	 * </pre>
	 * @Method Name : getUserListSearchCount
	 * @param SearchCriteria
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int getUserListSearchCount(SearchCriteria sc) throws Exception;
}
