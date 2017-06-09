package com.kedu.nodazi.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.nodazi.dto.ChartDto;
import com.kedu.nodazi.dto.PageMaker;
import com.kedu.nodazi.dto.PricesDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.service.RecStockService;

@Controller
@RequestMapping("/stock")
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	@Inject
	private RecStockService service;
	
	@RequestMapping(value = "/recommend", method = RequestMethod.GET)
	public void recommend(Model model) throws Exception{
		
		logger.info("/stock/recommend.GET.......................................");
				
		List<String> recStockList = service.readRecStock();
		
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
		
		model.addAttribute(service.readCode(code));
		
		logger.info("read.codeDto : " + service.readCode(code));
	}
	
	@ResponseBody
	@RequestMapping(value="/chartAjax", method=RequestMethod.GET)
	public HashMap<String, Object> chartAjax(/*@RequestParam int term, */@RequestParam String code, Model model) throws Exception{
		
//		code = 241180
		logger.info("code : " + code);
		List<PricesDto> recStock = service.readStockPrice(code, 5/*term*/);
		ChartDto		chart    = new ChartDto(); 
		
		chart.addColumn("month", "string");
		chart.addColumn("price_low", "number");
		chart.addColumn("price_open", "number");
		chart.addColumn("price_close", "number");
		chart.addColumn("price_high", "number");
		
		chart.createRows(5/*term*/);
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
		String format = null;
		
		for(int row=0; row<recStock.size(); row++){
			PricesDto dto = recStock.get(row);
			format = sdf.format(dto.getPrice_date());
			
			chart.addCell(row, dto.getPrice_date(), format);
			chart.addCell(row, dto.getPrice_low());
			chart.addCell(row, dto.getPrice_open());
			chart.addCell(row, dto.getPrice_close());
			chart.addCell(row, dto.getPrice_high());
		}
		
		logger.info("recStock : " + recStock);
		logger.info("chart.getResult() : " + chart.toString());
		
		return chart.getResult();
		
	}
	
}
