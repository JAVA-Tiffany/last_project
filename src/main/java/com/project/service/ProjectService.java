package com.project.service;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.BagListDAO;
import com.project.dao.DressListDAO;
import com.project.dao.EarringListDAO;
import com.project.dao.UserDAO;
import com.project.dto.BagListDTO;
import com.project.dto.DressListDTO;
import com.project.dto.EarringListDTO;
import com.project.dto.UserDTO;

@Service
public class ProjectService {
   @Autowired
   private UserDAO userdao;
   @Autowired
   private DressListDAO drlistdao;
   @Autowired
   private BagListDAO balistdao;
   @Autowired
   private EarringListDAO ealistdao;
   
   public void insert(UserDTO dto) {
      userdao.insert(dto);
   }
   public void delete(String num) {
      userdao.delete(num);
   }
   public void update(UserDTO dto) {
      userdao.update(dto);
   }
   
   // 회원가입시 ID 확인
   public void idch(Model model,String id) {
      if(userdao.select(id).getId().equals(id)) {
         model.addAttribute("id_result",userdao.select(id).getId());
      }else {
         model.addAttribute("id_result","");
      }
   }
   
   // 로그인시 ID, PW 확인
   public boolean loginch(String id, String pw) {
      if(userdao.select(id)!=null && userdao.select(id).getId().equals(id) && userdao.select(id).getPw().equals(pw)) {
         return true;
      }else {
         return false;
      }
   }
   
   public void dress(Model model) {
      List<DressListDTO> l = drlistdao.selectAll();
      ArrayList<String> arr= new ArrayList<String>();
      ArrayList<String> arr2= new ArrayList<String>();
      ArrayList<String> arr3= new ArrayList<String>();
      ArrayList<String> arr4= new ArrayList<String>();
      for(int i=0;i<l.size();i++) {
         arr.add("'"+l.get(i).getImg()+"'");
         arr2.add("'"+l.get(i).getProduct()+"'");
         arr3.add("'"+l.get(i).getPrice()+"'");         
         arr4.add("'"+l.get(i).getCount()+"'");         
      }
      model.addAttribute("list_img",arr);
      model.addAttribute("list_product",arr2);
      model.addAttribute("list_price",arr3);
      model.addAttribute("list_count",arr4);
   }
   
   public void bag(Model model) {
      List<BagListDTO> l = balistdao.selectAll();
      ArrayList<String> arr= new ArrayList<String>();
      ArrayList<String> arr2= new ArrayList<String>();
      ArrayList<String> arr3= new ArrayList<String>();
      ArrayList<String> arr4= new ArrayList<String>();
      for(int i=0;i<l.size();i++) {
         arr.add("'"+l.get(i).getImg()+"'");
         arr2.add("'"+l.get(i).getProduct()+"'");
         arr3.add("'"+l.get(i).getPrice()+"'");
         arr4.add("'"+l.get(i).getCount()+"'");         
      }
      model.addAttribute("list_img",arr);
      model.addAttribute("list_product",arr2);
      model.addAttribute("list_price",arr3);
      model.addAttribute("list_count",arr4);
   }
   
   public void earring(Model model) {
      List<EarringListDTO> l = ealistdao.selectAll();
      ArrayList<String> arr= new ArrayList<String>();
      ArrayList<String> arr2= new ArrayList<String>();
      ArrayList<String> arr3= new ArrayList<String>();
      ArrayList<String> arr4= new ArrayList<String>();
      for(int i=0;i<l.size();i++) {
         arr.add("'"+l.get(i).getImg()+"'");
         arr2.add("'"+l.get(i).getProduct()+"'");
         arr3.add("'"+l.get(i).getPrice()+"'");
         arr4.add("'"+l.get(i).getCount()+"'");         
      }
      model.addAttribute("list_img",arr);
      model.addAttribute("list_product",arr2);
      model.addAttribute("list_price",arr3);
      model.addAttribute("list_count",arr4);
   }
}