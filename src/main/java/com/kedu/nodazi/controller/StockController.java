package com.kedu.nodazi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.nodazi.dto.CodesDto;
import com.kedu.nodazi.dto.HistoryDto;
import com.kedu.nodazi.dto.PageMaker;
import com.kedu.nodazi.dto.RecStockDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.service.StockService;

@Controller
@RequestMapping("/stock")
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	@Inject
	private StockService service;
	
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public void recommend(Model model) throws Exception{
		
		logger.info("/stock/recommend.GET.......................................");
				
		List<CodesDto> recStockList   = service.readRecStock();
		
		model.addAttribute("recStockList", recStockList);
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(@ModelAttribute("cri") SearchCriteria cri
					, Model model) throws Exception{
		
		logger.info("/stock/list.GET.............................................");
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.searchListCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.searchListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@ModelAttribute("cri") SearchCriteria cri
					, @RequestParam("code") String code
					, Model model) throws Exception{
		
		logger.info("/stock/read.GET..............................................");
		
		CodesDto codeDto = service.readCode(code);
		List<HistoryDto> history = service.readHistoryDto(code);
		
		model.addAttribute("code", codeDto);
		model.addAttribute("history", history);
		
		logger.info("read.codeDto : " + codeDto);
		logger.info("read.history : " + history);
	}
	
	
	
}
