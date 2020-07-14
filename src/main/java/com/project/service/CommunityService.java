package com.project.service;

import java.util.ArrayList;
import java.util.List;

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

   public void delete(CommnuityDTO dto) {
      dao.delete(dto);
   }

   public void update_save(CommnuityDTO dto) {
      dao.update_save(dto);
   }

   public void update(CommnuityDTO dto, Model model) {
      model.addAttribute("view", dao.view(dto));
   }

   public void title_search(CommnuityDTO dto, Model model, String type_result,String search_result) {
      List<CommnuityDTO> arr =dao.listAll(dto);
      ArrayList<CommnuityDTO> newarr = new ArrayList<CommnuityDTO>();
      if(type_result.equals("title")){
         for(int i=0;i<arr.size();i++) {
            if(arr.get(i).getTitle().contains(search_result)) {
               newarr.add(arr.get(i));
            }
         }
      }else if(type_result.equals("Content")) {
         for(int i=0;i<arr.size();i++) {
            if(arr.get(i).getContent().contains(search_result)) {
               newarr.add(arr.get(i));
            }
         }
      }else {
         for(int i=0;i<arr.size();i++) {
            if(arr.get(i).getWriter().equals(search_result)) {
               newarr.add(arr.get(i));
            }
         }
      }
      model.addAttribute("listAll",newarr);
   }

}