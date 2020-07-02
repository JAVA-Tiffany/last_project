package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.UserimgDAO;
import com.project.dto.UserimgDTO;

@Service
public class cartService {
	@Autowired
	private UserimgDAO dao;
	public void cart_insert(HttpServletRequest request,@RequestParam String userimg_in,@RequestParam String imgname,@RequestParam String imgmoney) {
		
		HttpSession session = request.getSession();
		UserimgDTO dto = new UserimgDTO();
		dto.setId(session.getAttribute("id").toString());
		dto.setMoney(Integer.valueOf(imgmoney));
		dto.setImg("resources/userimg"+userimg_in);
		dto.setProduct(imgname);
		dto.setCancelok("대기");
		dao.insert(dto);
	}
}
