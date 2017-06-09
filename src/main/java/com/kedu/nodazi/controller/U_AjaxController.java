package com.kedu.nodazi.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kedu.nodazi.dto.UserDto;
import com.kedu.nodazi.service.UserService;
@Controller
@RequestMapping("/user")
public class U_AjaxController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService uservice;
	

	@RequestMapping(value="/info",method = RequestMethod.GET)
	public void InfoGET(Model model, HttpSession session)throws Exception{

		
		Object obj = session.getAttribute("login");
		UserDto udto = (UserDto)obj;
		String u_id = udto.getU_id();
		model.addAttribute("udto",uservice.info(u_id));
		logger.info("infoGET");

	}
	
	@RequestMapping(value="/{u_id}",method= {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("u_id")String u_id,@RequestBody UserDto udto){
		ResponseEntity<String>entity = null;
		try{
			udto.setU_id(u_id);
			uservice.userUpdate(udto);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(
					e.getMessage(),HttpStatus.BAD_REQUEST);
	}
		return entity;
		
	}
	
}
