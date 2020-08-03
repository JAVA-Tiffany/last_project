package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.HelpDAO;
import com.project.dto.HelpDTO;

@Service
public class HelpService {
	
	@Autowired
	private HelpDAO helpdao;
	
	
	public void list(Model model) {
		model.addAttribute("list",helpdao.list());
		
		
	}
	
}
