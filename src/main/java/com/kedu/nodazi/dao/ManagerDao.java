package com.kedu.nodazi.dao;

import java.util.List;

import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.SearchCriteria;

public interface ManagerDao {
	
	public List<PaymentDto> paymentListSearch(SearchCriteria sc) throws Exception;
	
	public int paymentListSearchCount(SearchCriteria sc) throws Exception;
	
	public void updatePaymentStatus(List<PaymentDto> list) throws Exception; 
	
	public List<PaymentDto> userListSearch(SearchCriteria sc) throws Exception;
	
	public int userListSearchCount(SearchCriteria sc) throws Exception;
}
