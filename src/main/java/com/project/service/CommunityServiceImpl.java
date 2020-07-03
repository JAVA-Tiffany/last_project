package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.CommnuityDAO;
import com.project.dto.CommnuityDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
   @Autowired
   private CommnuityDAO dao;

   @Override
   public void listAll(CommnuityDTO dto, Model model) {
      model.addAttribute("listAll",dao.listAll(dto));

   }

   @Override
   public void view(CommnuityDTO dto, Model model) {
            model.addAttribute("view",dao.view(dto));   
   }

   @Override
   public void count(CommnuityDTO dto) {
      dao.count(dto);
      
   }

   @Override
   public void save_write(CommnuityDTO dto) {
      dao.save_write(dto);
   }

   @Override
   public void delete(CommnuityDTO dto) {
      dao.delete(dto);
      
   }

   @Override
   public void update_save(CommnuityDTO dto) {
      dao.update_save(dto);
      
   }

   @Override
   public void update(CommnuityDTO dto, Model model) {
      model.addAttribute("view",dao.view(dto));   
      
   }
   
   

   
   
   
   
}