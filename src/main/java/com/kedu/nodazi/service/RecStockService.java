package com.kedu.nodazi.service;

import java.util.List;

import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.SearchCriteria;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.service
 * RecStockService.java
 * </pre>
 * @author	: 오윤진
 * @Date	: 2017. 5. 26.
 * @Version	: 1.0
 *****************************************************/
public interface RecStockService {

	/*****************************************************
	 * <pre>
	 * 1. 개요	: 오늘 추천될 종목을 조회
	 * 2. 처리내용	: 오늘 날짜로 추천될 종목을 조회
	 * </pre>
	 * @Method Name : readRecStock
	 * @return		: List<String>
	 * @throws		  Exception
	 *****************************************************/
	public List<String> readRecStock() throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목의 주가정보를 조회
	 * 2. 처리내용	: 종목코드와 조회할 기간을 받아서 주가데이터를 조회
	 * </pre>
	 * @Method Name : readStockPrice
	 * @param		  code
	 * @param		  term
	 * @return		  List<PricesDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PricesDto> readStockPrice(String code, int term) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목 목록 조회
	 * 2. 처리내용	: 검색과 페이징이 적용된 목록 조회
	 * </pre>
	 * @Method Name : searchList
	 * @param		  cri
	 * @return		  List<PricesDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PricesDto> searchListCriteria(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목 개수 조회
	 * 2. 처리내용	: 페이징 계산을 위해 검색이 적용된 총 종목 개수 조회
	 * </pre>
	 * @Method Name : searchListCount
	 * @param		  cri
	 * @return		  int
	 * @throws		  Exception
	 *****************************************************/
	public int searchListCount(SearchCriteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 종목 상세 조회
	 * 2. 처리내용	: code로 종목에 대한 정보 조회
	 * </pre>
	 * @Method Name : read
	 * @param		  code
	 * @return		  CodesDto
	 * @throws		  Exception
	 *****************************************************/
	public CodesDto readCode(String code) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 주가 상세 조회
	 * 2. 처리내용	: code로 종목에 대한 주가 조회
	 * </pre>
	 * @Method Name : read
	 * @param		  code
	 * @return		  List<PricesDto>
	 * @throws		  Exception
	 *****************************************************/
	public List<PricesDto> readPrice(String code) throws Exception;
	
}
