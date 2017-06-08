package com.kedu.nodazi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.nodazi.dao.RecStockDao;
import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.SearchCriteria;

@Service
public class RecStockServiceImpl implements RecStockService{

	@Inject
	private RecStockDao dao;

	@Override
	public List<String> readRecStock() throws Exception {
		
		return dao.readRecStock();
	}

	@Override
	public List<PricesDto> readStockPrice(String code, int term) throws Exception {
		
		return dao.readStockPrice(code, term);
	}

	@Override
	public List<PricesDto> searchListCriteria(SearchCriteria cri) throws Exception {
		return dao.searchList(cri);
	}

	@Override
	public int searchListCount(SearchCriteria cri) throws Exception {
		return dao.searchListCount(cri);
	}

	@Override
	public CodesDto readCode(String code) throws Exception {
		return dao.readCode(code);
	}

	@Override
	public List<PricesDto> readPrice(String code) throws Exception {
		return dao.readPrice(code);
	}

	
}
