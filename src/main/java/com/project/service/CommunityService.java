package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.CommnuityDAO;
import com.project.dto.CommnuityDTO;

@Service
public class CommunityService {
	@Autowired
	private CommnuityDAO dao;

	public void listAll(CommnuityDTO dto, Model model) {
		model.addAttribute("listAll", dao.listAll(dto));
	}

	public void view(CommnuityDTO dto, Model model) {
		model.addAttribute("view", dao.view(dto));
	}

	public void count(CommnuityDTO dto) {
		dao.count(dto);
	}

	public void save_write(CommnuityDTO dto) {
		dao.save_write(dto);
	}

	public void delete(int num) {
		dao.delete(num);
	}

	public void update_save(CommnuityDTO dto) {
		dao.update_save(dto);
	}

	public void update(CommnuityDTO dto, Model model) {
		model.addAttribute("view", dao.view(dto));
	}

}