package com.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.CommnuityDTO;
import com.project.service.CommunityService;

@Controller
public class CommunityController {
	
	@Inject
	CommunityService service;
	
	@RequestMapping("list")
	public ModelAndView list() {
		List<CommnuityDTO> list = service.listAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("community/list");
		return mav;

	}
	
	@RequestMapping("view")
	public String view(CommnuityDTO dto, Model model) {
		service.count(dto);
		service.view(dto,model);
		
		return "community/view";
	}
	
	@RequestMapping("write")
	public String write() {
		return "community/write";
	}
	
	@RequestMapping("save_write")
	public String save_write(CommnuityDTO dto) {
		service.save_write(dto);
		return "redirect:list";
	}
	
	
	
	@RequestMapping("update")
	public String update(CommnuityDTO dto,Model model) {
		service.update(dto,model);
		return "community/update";
	}
	
	@RequestMapping("update_save")
	public String update_sava(CommnuityDTO dto) {
		service.update_save(dto);
		return "redirect:list";
	}
	
	@RequestMapping("delete")
	public String delete(CommnuityDTO dto) {
		service.delete(dto);
		return "redirect:list";
	}
	
	
	@RequestMapping("notice")
	public String notice() {
		return "community/notice";
	}
	
	@RequestMapping("review")
	public String review() {
		return "community/Review";
	}
	
//	@RequestMapping("qa")
//	public String Qa() {
//		return "community/Qa";
//	}
	
	
}
