package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.CommnuityDAO;
import com.project.dao.DressListDAO;
import com.project.dao.EarringListDAO;
import com.project.dao.AdminDAO;
import com.project.dao.BagListDAO;
import com.project.dto.AdminNoticeDTO;
import com.project.dto.BagListDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.DressListDTO;
import com.project.dto.EarringListDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO dao;

	@Autowired
	private CommnuityDAO comdao;
	@Autowired
	private DressListDAO drlistdao;
	@Autowired
	private BagListDAO balistdao;
	@Autowired
	private EarringListDAO ealistdao;

	public void listAll(AdminNoticeDTO dto, Model model) {
		model.addAttribute("listAll",dao.listAll(dto));

	}

	public void view(AdminNoticeDTO dto, Model model) {
		model.addAttribute("view",dao.view(dto));   
	}
	public void count(AdminNoticeDTO dto) {
		dao.count(dto);

	}

	public void save_write(AdminNoticeDTO dto) {
		dao.save_write(dto);
	}
	public void delete(int num) {
		dao.delete(num);

	}

	public void deleteQA(int num) {
		dao.deleteQA(num);
	}

	public void ModifySave(AdminNoticeDTO dto) {
		dao.save_Modify(dto);
	}
	
	public void selectAllQuantity(Model model) {
		List<DressListDTO> dress = drlistdao.selectAll();
		List<BagListDTO> bag = balistdao.selectAll();
		List<EarringListDTO> earling = ealistdao.selectAll();

		model.addAttribute("dress",dress);
		model.addAttribute("bag",bag);
		model.addAttribute("earling",earling);
		
	}
	
	
	public void updateQuantity(String product,String quantity) {
		DressListDTO dress = new DressListDTO();
		dress.setProduct(product);dress.setQuantity(Integer.parseInt(quantity));
		drlistdao.updateQuantity(dress);
	}
}





