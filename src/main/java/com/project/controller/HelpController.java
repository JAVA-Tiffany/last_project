package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.service.HelpService;

@Controller
public class HelpController {
	
	
	@Autowired
	private HelpService helpservice;
	
	@RequestMapping("helpCenter")
	public String helpCenter(@RequestParam String type) {
		if(type.equals("order_pay")) {
			return "help/help_order_pay";
		}else if(type.equals("make_group")) {
			return "help/help_make_group";
		}else {
			return "help/help_image_print";
		}
		
		
	}
	
	
	
	
	
}
