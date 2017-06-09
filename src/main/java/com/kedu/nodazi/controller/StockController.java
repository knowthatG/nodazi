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
		
//		chart.addColumn("month", "string");
//		chart.addColumn("company", "number");
		
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
		
		/*
		{
			"rows":[
					{"c":[{"v":1477353600000,"f":"10/25"}
						,{"v":10880,"f":null}
						,{"v":10880,"f":null}
						,{"v":10940,"f":null}
						,{"v":10965,"f":null}]}
					,{"c":[{"v":1477267200000,"f":"10/24"}
						,{"v":10865,"f":null}
						,{"v":10875,"f":null}
						,{"v":10880,"f":null}
						,{"v":10880,"f":null}]}
					,{"c":[{"v":1477008000000,"f":"10/21"}
						,{"v":10875,"f":null}
						,{"v":10885,"f":null}
						,{"v":10875,"f":null}
						,{"v":10885,"f":null}]}
					,{"c":[{"v":1476921600000,"f":"10/20"}
						,{"v":10675,"f":null}
						,{"v":10675,"f":null}
						,{"v":10750,"f":null}
						,{"v":10750,"f":null}]}
					,{"c":[{"v":1476748800000,"f":"10/18"}
						,{"v":10675,"f":null}
						,{"v":10680,"f":null}
						,{"v":10675,"f":null}
						,{"v":10680,"f":null}]}
					]
			,"cols":[
					 {"pattern":""
					 	,"id":""
					 	,"label":"month"
					 	,"type":"string"
					 }
					 ,{"pattern":""
					 	,"id":""
					 	,"label":"company"
					 	,"type":"number"
					 }
					]
		}
		
		*/
		
//		SimpleDateFormat sdf = new SimpleDateFormat("MM.dd");
//		
//		for(PricesDto dto : recStock){
//			dto.setPrice_date(sdf.format(dto.getPrice_date()));
//		}
		
		logger.info("recStock : " + recStock);
		logger.info("chart.getResult() : " + chart.toString());
		
		return chart.getResult();
		
/*		List<PricesDto> recStrock1 = service.readStockPrice(recStockList.get(0), 5);
		List<PricesDto> recStrock2 = service.readStockPrice(recStockList.get(1), 5);
		List<PricesDto> recStrock3 = service.readStockPrice(recStockList.get(2), 5);
		List<PricesDto> recStrock4 = service.readStockPrice(recStockList.get(3), 5);
		List<PricesDto> recStrock5 = service.readStockPrice(recStockList.get(4), 5);
		
		logger.info("recStockList : " + recStockList);
		logger.info("recStrock1 : " + recStrock1.toString());
		logger.info("recStrock2 : " + recStrock2);
		logger.info("recStrock3 : " + recStrock3);
		logger.info("recStrock4 : " + recStrock4);
		logger.info("recStrock5 : " + recStrock5);
		
		model.addAttribute("recStockList", recStockList);
		model.addAttribute("recStock1", recStrock1);
		model.addAttribute("recStock2", recStrock2);
		model.addAttribute("recStock3", recStrock3);
		model.addAttribute("recStock4", recStrock4);
		model.addAttribute("recStock5", recStrock5);*/
	}
	
}
