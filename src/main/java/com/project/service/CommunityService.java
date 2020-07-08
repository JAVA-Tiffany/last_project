package com.project.service;

import java.util.List;

import org.springframework.ui.Model;

import com.project.dto.CommnuityDTO;


public interface CommunityService {
   
   public void listAll(CommnuityDTO dto, Model model);

   public void view(CommnuityDTO dto, Model model);

   public void count(CommnuityDTO dto);

   public void save_write(CommnuityDTO dto);

   public void delete(CommnuityDTO dto);

   public void update_save(CommnuityDTO dto);

   public void update(CommnuityDTO dto, Model model);
}