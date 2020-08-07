package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.CommnuityDAO;
import com.project.dao.ReplyDAO;
import com.project.dao.payDAO;
import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.PayDTO;

@Service
public class CommunityService {
   @Autowired
   private CommnuityDAO dao;
   @Autowired
   private ReplyDAO replydao;
   @Autowired
   private payDAO paydao;
   

   public void listAll(CommnuityDTO dto, Model model) {
      if(dto.getStart()==null) {
         dto.setStart("1");
         dto.setEnd("10");
      }
         List<CommnuityDTO> list = dao.listAll(dto);
        for (CommnuityDTO value : list) {
         int num = value.getBno();
         value.setReplycount(replydao.replycount(num));
      }
        model.addAttribute("listAll", list);
        model.addAttribute("list_size", dao.board_select_count());
         model.addAttribute("list_last", dto.getEnd());
      }
   public void view(CommnuityDTO dto, Model model) {
      model.addAttribute("view", dao.view(dto));
   }
   public void adminview(CommnuityDTO dto, Model model) {
      model.addAttribute("adminList",dao.adminlist(dto));
   }

   public void count(CommnuityDTO dto) {
      dao.count(dto);
   }

   public void save_write(CommnuityDTO dto) {
      dao.save_write(dto);
   }

   public void delete(CommnuityDTO dto) {
      dao.delete(dto);
   }

   public void update_save(CommnuityDTO dto) {
      dao.update_save(dto);
   }

   public void update(CommnuityDTO dto, Model model) {
      model.addAttribute("view", dao.view(dto));
   }

   public void title_search(CommnuityDTO dto, Model model, String type_result,String search_result,String start_result,String end_result) {
      List<CommnuityDTO> arr = null;
      String s=null;
      dto.setStart(start_result);
      dto.setEnd(end_result);
      System.out.println(search_result);
     if(type_result.equals("title")){
        dto.setTitle(search_result);
        arr=dao.listSearch_title(dto);
        s=dao.listSearch_title_count(dto);
      }else if(type_result.equals("Content")) {
         dto.setContent(search_result);
         arr=dao.listSearch_Content(dto);
         s=dao.listSearch_Content_count(dto);
      }else {
         dto.setWriter(search_result);
         arr=dao.listSearch(dto);
         s=dao.listSearch_count(dto);
      }
     if(s==null) {
        model.addAttribute("list_size", 0);
     }else {
        model.addAttribute("list_size", s);
     }
     model.addAttribute("listAll", arr);
     model.addAttribute("list_last", dto.getEnd());
     model.addAttribute("list_type_result", type_result);
     model.addAttribute("list_search_result", search_result);
   }
   public void notice_search(CommnuityDTO dto, Model model, String type_result,String search_result,String start_result,String end_result) {
      List<AdminNoticeDTO> arr = null;
      String s=null;
      dto.setStart(start_result);
      dto.setEnd(end_result);
      System.out.println(search_result);
     if(type_result.equals("title")){
        dto.setTitle(search_result);
        arr=dao.noticeSearch_title(dto);
        s=dao.noticeSearch_title_count(dto);
      }else {
         dto.setContent(search_result);
         arr=dao.noticeSearch_Content(dto);
         s=dao.noticeSearch_Content_count(dto);
      }
     if(s==null) {
        model.addAttribute("list_size", 0);
     }else {
        model.addAttribute("list_size", s);
     }
     model.addAttribute("listAll", arr);
     model.addAttribute("list_last", dto.getEnd());
     model.addAttribute("list_type_result", type_result);
     model.addAttribute("list_search_result", search_result);
   }
   public void cart_search(PayDTO dto, Model model, String type_result,String search_result,String start_result,String end_result) {
      List<PayDTO> arr = null;
      String s=null;
      dto.setStart(start_result);
      dto.setEnd(end_result);
      System.out.println(search_result);
     if(type_result.equals("id")){
        dto.setId(search_result);
        arr=paydao.cartSearch_id(dto);
        s=paydao.cartSearch_id_count(dto);
      }else {
         dto.setOrder_id(search_result);
         arr=paydao.cartSearch_order_id(dto);
         s=paydao.cartSearch_order_id_count(dto);
      }
     if(s==null) {
        model.addAttribute("list_size", 0);
     }else {
        model.addAttribute("list_size", s);
     }
     model.addAttribute("paylist", arr);
     model.addAttribute("list_last", dto.getEnd());
     model.addAttribute("list_type_result", type_result);
     model.addAttribute("list_search_result", search_result);
   }

}