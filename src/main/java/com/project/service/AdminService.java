package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.CommnuityDAO;
import com.project.dao.DataListDAO;
import com.project.dao.AdminDAO;
import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.DataListDTO;

@Service
public class AdminService {

   @Autowired
   private AdminDAO dao;

   @Autowired
   private CommnuityDAO comdao;
   
   @Autowired
   private DataListDAO datadao;

   public void adminList(AdminNoticeDTO dto, Model model) {
      model.addAttribute("adminList",dao.adminList(dto));
   }
   
   
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
      List<DataListDTO> data = datadao.selectAll();
      model.addAttribute("datalist",data);
   }
   
   
   public void updateQuantity(String product,String quantity,String type) {
      DataListDTO data = new DataListDTO();
      data.setProduct(product);data.setQuantity(Integer.parseInt(quantity));
      data.setType(type);
      datadao.updateQuantity(data);
   }
   
   public void save_writeBoard(CommnuityDTO dto) {
      String title = "<b style='color:black;'>[공지]"+dto.getTitle() + "</b>";
      dto.setTitle(title);
      dao.save_writeBoard(dto);
      
   }
}




