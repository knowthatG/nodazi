package com.kedu.nodazi.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kedu.nodazi.dao.StockDao;
import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.RecStockDto;
import com.kedu.nodazi.dto.SearchCriteria;

@Service
public class StockServiceImpl implements StockService{

	@Inject
	private StockDao dao;

	@Override
	public List<CodesDto> readRecStock() throws Exception {
		
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
	public List<PricesDto> readPricePage(String code, Criteria cri) throws Exception {
		return dao.readPricePage(code, cri);
	}

	@Override
	public List<Date> readHistory(String code) throws Exception {
		return dao.readHistory(code);
	}

	@Override
	public Integer readPriceCount(String code) throws Exception {
		return dao.readPriceCount(code);
	}


}
