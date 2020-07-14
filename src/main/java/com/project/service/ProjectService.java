package com.project.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.DataListDAO;
import com.project.dao.UserDAO;
import com.project.dto.DataListDTO;
import com.project.dto.UserDTO;

@Service
public class ProjectService {
	@Autowired
	private UserDAO userdao;
	@Autowired
	private DataListDAO datalistdao;

	public void insert(UserDTO dto) {
		userdao.insert(dto);
	}

	public void delete(String num) {
		userdao.delete(num);
	}

	public void update(UserDTO dto) {
		userdao.update(dto);
	}

	public void select(Model model) {
		model.addAttribute("list", userdao.selectAll());
	}

	// 회원가입시 ID 확인
	public void idch(Model model, String id) {
		if (userdao.select(id).getId().equals(id)) {
			model.addAttribute("id_result", userdao.select(id).getId());
		} else {
			model.addAttribute("id_result", "");
		}
	}

	// 로그인시 ID, PW 확인
	public boolean loginch(String id, String pw) {
		if (userdao.select(id) != null && userdao.select(id).getId().equals(id)
				&& userdao.select(id).getPw().equals(pw)) {
			return true;
		} else {
			return false;
		}
	}
	public void data(Model model,String type) {
		DataListDTO dto = new DataListDTO();
		dto.setType(type);
		List<DataListDTO> l = datalistdao.select(dto);
		ArrayList<String> arr = new ArrayList<String>();
		ArrayList<String> arr2 = new ArrayList<String>();
		ArrayList<String> arr3 = new ArrayList<String>();
		ArrayList<String> arr4 = new ArrayList<String>();
		for (int i = 0; i < l.size(); i++) {
			arr.add("'" + l.get(i).getImg() + "'");
			arr2.add("'" + l.get(i).getProduct() + "'");
			arr3.add("'" + l.get(i).getPrice() + "'");
			arr4.add("'" + l.get(i).getCount() + "'");
		}
		model.addAttribute("list_img", arr);
		model.addAttribute("list_product", arr2);
		model.addAttribute("list_price", arr3);
		model.addAttribute("list_count", arr4);
	}

	public void myinfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("myinfo_list", userdao.select(session.getAttribute("id").toString()));
	}

	public String header_review_list() {
		List<DataListDTO> arr = datalistdao.selectAll();
		return arr.get(0).getProduct();
	}
}