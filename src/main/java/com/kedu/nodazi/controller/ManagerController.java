package com.kedu.nodazi.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.nodazi.dto.PageMaker;
import com.kedu.nodazi.dto.PaymentDto;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private ManagerService service;
	
	
	@RequestMapping(value="/paymentList", method = RequestMethod.GET)
	public String paymentListSearch(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list",service.getPaymentListSearch(cri));
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.getPaymentListSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	    
		return "/manager/payManagement";
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/confirm", method = RequestMethod.POST)
	public List<PaymentDto> approvePayment(@RequestBody Map<String, Object> json) throws Exception{
		
		List<PaymentDto> approvalList = (List<PaymentDto>) json.get("data");
		
		service.confirmPayment(approvalList);
		
		SearchCriteria cri  = (SearchCriteria) json.get("search");
		
		/*model.addAttribute("list",service.getPaymentListSearch(cri));
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.getPaymentListSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);*/
	    
	    return service.getPaymentListSearch(cri);
		
	}
	
	
	@RequestMapping(value="/userList", method = RequestMethod.GET)
	public String userListSearch(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list",service.getUserListSearch(cri));
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.getUserListSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	    
		return "/manager/userManagement";
	} 
	
	
	
	
}
