package com.project.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.UserimgDAO;
import com.project.dto.UserimgDTO;

@Service
public class cartService {
   @Autowired
   private UserimgDAO dao;
   public void cart_insert(HttpServletRequest request,@RequestParam String userimg_in,@RequestParam String imgname,@RequestParam String imgmoney,String type) {
      
      HttpSession session = request.getSession();
      UserimgDTO dto = new UserimgDTO();
      dto.setId(session.getAttribute("id").toString());
      dto.setMoney(imgmoney);
      dto.setImg("resources/userimg/"+userimg_in);
      dto.setProduct(imgname);
      dto.setCancelok("대기");
      dto.setType(type);
      dao.insert(dto);
   }
   public List<UserimgDTO> cart_select(Model model,String id) {
      List<UserimgDTO> arr = dao.select(id);
      return arr;
   }
   public void cart_delete(HttpServletRequest request,String img) {
      UserimgDTO dto = new UserimgDTO();
      HttpSession session = request.getSession();
      dto.setId(session.getAttribute("id").toString());
      dto.setImg(img);
      dao.delete(dto);
      // 삭제할 파일 경로
      
      File file = new File("C:\\WorkSpace\\last_project_merge\\src\\main\\webapp\\resources\\userimg\\"+img.split("/")[2]); 
      if( file.exists() ){ 
         if(file.delete()) { 
            System.out.println("파일삭제 성공"); 
         }else{ 
            System.out.println("파일삭제 실패"); 
         } 
      }else{ 
         System.out.println("파일이 존재하지 않습니다."); 
      }

   }
   
   public void cart_update(String id ,int num, String product) {
	      UserimgDTO dto = new UserimgDTO();
	      dto.setId(id);
	      dto.setNum(Integer.toString(num));
	      dto.setProduct(product);
	      dao.update_Count(dto);
	   }
	   
	   public void cart_update2(String id ,int num, String product) {
	      UserimgDTO dto = new UserimgDTO();
	      dto.setId(id);
	      dto.setNum(Integer.toString(num));
	      dto.setProduct(product);
	      dao.update_Countd(dto);
	   }
}
