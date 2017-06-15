package com.kedu.nodazi.dao;

import java.util.List;

import com.kedu.nodazi.dto.Criteria;
import com.kedu.nodazi.dto.ReplyDto;

/*****************************************************
 * <pre>
 * com.kedu.nodazi.dao
 * ReplyDao.java
 * </pre>
 * @author	: 김윤화
 * @Date	: 2017. 6. 5.
 * @Version	: 1.0
 *****************************************************/
public interface ReplyDao {
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 목록 출력
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : list
	 * @param b_no
	 * @return List<ReplyDto>
	 * @throws Exception
	 *****************************************************/
	public List<ReplyDto> list(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 작성
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : create
	 * @param rDto
	 * @throws Exception
	 *****************************************************/
	public void create(ReplyDto rDto) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 수정
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : update
	 * @param rDto
	 * @throws Exception
	 *****************************************************/
	public void update(ReplyDto rDto) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 삭제
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : delete
	 * @param r_no
	 * @throws Exception
	 *****************************************************/
	public void delete(int r_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 목록 페이징
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : listPage
	 * @param b_no
	 * @param cri
	 * @return List<ReplyDto>
	 * @throws Exception
	 *****************************************************/
	public List<ReplyDto> listPage(int b_no, Criteria cri) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 댓글 개수
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : count
	 * @param b_no
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int count(int b_no) throws Exception;
	
	/*****************************************************
	 * <pre>
	 * 1. 개요	: 게시글 번호
	 * 2. 처리내용	: 
	 * </pre>
	 * @Method Name : getB_no
	 * @param r_no
	 * @return int
	 * @throws Exception
	 *****************************************************/
	public int getB_no(int r_no) throws Exception;
}
