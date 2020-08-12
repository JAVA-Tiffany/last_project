package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.DataListDAO;
import com.project.dao.ReviewDAO;
import com.project.dao.payDAO;
import com.project.dto.DataListDTO;
import com.project.dto.PayDTO;
import com.project.dto.ReviewDTO;

@Service
public class ReviewService {
   @Autowired
   private ReviewDAO reviewdao;
   @Autowired 
   private DataListDAO datalistDAO;
   @Autowired 
   private payDAO paydao;
   
   public void selectAll(Model model) {
      List<ReviewDTO> arr =reviewdao.selectAll();
      
      model.addAttribute("review_list", arr);
   }
   
   
   public void categoryList(Model model,String type) {
	   List<ReviewDTO> arr = reviewdao.selectType(type);
	   
	   
	   if(type.equals("all")) {
		   arr =reviewdao.selectAll();
		   model.addAttribute("review_list", arr);
	   }else {
		   model.addAttribute("review_list", arr);
	   }
	   
	   
   }
   
   
//   public void select(Model model,String search_img,String type,String search_text) {
//      ReviewDTO dto = new ReviewDTO();
//      dto.setImg(search_img);
//      List<ReviewDTO> arr = reviewdao.selectAll(dto);
//      ArrayList<ReviewDTO> newarr = new ArrayList<ReviewDTO>();
//      if(type.equals("subject")) {
//         for(int i=0;i<arr.size();i++) {
//            if(arr.get(i).getTitle().contains(search_text)) {
//               System.out.println("제목");
//               newarr.add(arr.get(i));
//            }
//         }
//         model.addAttribute("review_list", newarr);
//         model.addAttribute("review_img",search_img);
//      }else if(type.equals("content")){
//         for(int i=0;i<arr.size();i++) {
//            if(arr.get(i).getContent().contains(search_text)) {
//               System.out.println("내용");
//               newarr.add(arr.get(i));
//            }
//         }
//         model.addAttribute("review_list", newarr);
//         model.addAttribute("review_img",search_img);
//      }else if(type.equals("member_id")) {
//         for(int i=0;i<arr.size();i++) {
//            if(arr.get(i).getName().equals(search_text)) {
//               System.out.println("id");
//               newarr.add(arr.get(i));
//            }
//         }
//         model.addAttribute("review_list", newarr);
//         model.addAttribute("review_img",search_img);
//      }else {
//         dto.setImg(search_text);
//         List<ReviewDTO> arr2 = reviewdao.selectAll(dto);
//         model.addAttribute("review_list", arr2);
//         model.addAttribute("review_img",search_text);
//      }
//      List<DataListDTO> l3=datalistDAO.selectAll();
//      ArrayList<DataListDTO> newl3= new ArrayList<DataListDTO>();
//      int a=0;
//      for(int i=0;i<l3.size();i++) {
//         for(int x=0;x<newl3.size();x++) {
//            if(l3.get(i).getProduct().equals(newl3.get(x).getProduct())) {
//               a=1;
//               break;
//            }
//         }
//         if(a==0) {
//            newl3.add(l3.get(i));
//         }else {
//            a=0;
//         }
//      }
//      ArrayList<String> list_name = new ArrayList<String>();
//      for(int i=0;i<newl3.size();i++) {
//         list_name.add("'"+newl3.get(i).getProduct()+"'");
//      }
//      model.addAttribute("review_listAll",list_name);
//   }
   
   public void update_info(String rno) {
      reviewdao.update_info(rno);
   }
   public void update(ReviewDTO dto) {
      reviewdao.update(dto);
   }
   public void delect(String rno) {
      reviewdao.delect(rno);
   }
   public void save(ReviewDTO dto) {
      PayDTO paydto = new PayDTO();
      paydto.setRno(dto.getPay_rno());
      paydao.update_review_ch(paydto);
      reviewdao.insert(dto);
   }

   public void update_nofileimg(ReviewDTO dto) {
	      reviewdao.update_nofileimg(dto);
	   }





   
}