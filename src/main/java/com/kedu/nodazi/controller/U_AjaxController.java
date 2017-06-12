package com.kedu.nodazi.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kedu.nodazi.dto.UserDto;
import com.kedu.nodazi.service.UserService;
@RestController
@RequestMapping("/user")
public class U_AjaxController {
	
	@Inject
	private UserService uservice;		

	
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
