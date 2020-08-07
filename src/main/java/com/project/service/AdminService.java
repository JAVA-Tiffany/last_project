package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.CommnuityDAO;
import com.project.dao.DataListDAO;
import com.project.dao.payDAO;
import com.project.dao.AdminDAO;
import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.DataListDTO;
import com.project.dto.PayDTO;

@Service
public class AdminService {

   @Autowired
   private AdminDAO dao;

   @Autowired
   private CommnuityDAO comdao;

   @Autowired
   private DataListDAO datadao;
   
   @Autowired
   private payDAO paydao;

   public void adminList(AdminNoticeDTO dto, Model model) {
      model.addAttribute("adminList", dao.adminList(dto));
      model.addAttribute("list_size",dao.notice_select_count());
   }

   public void listAll(AdminNoticeDTO dto, Model model) {
      if(dto.getStart()==null) {
            dto.setStart("1");
            dto.setEnd("10");
         }
      model.addAttribute("listAll", dao.listAll(dto));
      model.addAttribute("list_size",dao.notice_select_count());
      model.addAttribute("list_last",dto.getEnd());
   }

   public void view(AdminNoticeDTO dto, Model model) {
      model.addAttribute("view", dao.view(dto));
   }

   public void viewBoard(CommnuityDTO dto, Model model) {
      model.addAttribute("view", dao.viewBoard(dto));
   }

   public void count(AdminNoticeDTO dto) {
      dao.count(dto);

   }

   public void save_write(AdminNoticeDTO dto) {
	   String title = "<b style='color:black;'>[공지]" + dto.getTitle() + "</b>";
	     dto.setTitle(title);
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
      model.addAttribute("datalist", data);
   }

   public void updateQuantity(String product, String quantity, String type) {
      DataListDTO data = new DataListDTO();
      data.setProduct(product);
      data.setQuantity(Integer.parseInt(quantity));
      data.setType(type);
      datadao.updateQuantity(data);
   }

   public void save_writeBoard(CommnuityDTO dto) {
      String title = "<b style='color:black;'>[공지]" + dto.getTitle() + "</b>";
      dto.setTitle(title);
      dao.save_writeBoard(dto);

   }

   public void choiceCategory(String choice, Model model) {
      List<DataListDTO> data = datadao.selectPick(choice);
      model.addAttribute("PickData", data);
   }

   public void AddProduct(DataListDTO dto) {
      dao.AddProduct(dto);
   }

   public void DelProduct(String product) {
      dao.DelProduct(product);
   }
   public void accart_list(Model model,String start,String end) {
      PayDTO dto = new PayDTO();
      dto.setStart(start);
      dto.setEnd(end);
      model.addAttribute("paylist",paydao.selectAll_number(dto));
      model.addAttribute("list_last",end);
      model.addAttribute("list_size",paydao.selectAll_size());
   }

}