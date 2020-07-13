package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.CommnuityDAO;
import com.project.dao.AdminDAO;
import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;

@Service
public class AdminService {

   @Autowired
   private AdminDAO dao;
   
   @Autowired
   private CommnuityDAO comdao;
   
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

}