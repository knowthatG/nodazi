package com.kedu.nodazi.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.nodazi.dto.PageMaker;
import com.kedu.nodazi.dto.SearchCriteria;
import com.kedu.nodazi.service.ManagerService;

@Controller
@RequestMapping("/manger")
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private ManagerService service;
	
	
	@RequestMapping(value="/paymentList", method = RequestMethod.GET)
	public String userListSearch(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		logger.info(cri.toString());
		
		model.addAttribute("list",service.getPaymentListSearch(cri));
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.getPaymentListSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	    
		return "/manager/payManagement";
	}
	
	
	
	
}
