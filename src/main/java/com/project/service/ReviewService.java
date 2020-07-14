package com.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.BagListDAO;
import com.project.dao.DressListDAO;
import com.project.dao.EarringListDAO;
import com.project.dao.ReviewDAO;
import com.project.dto.BagListDTO;
import com.project.dto.DressListDTO;
import com.project.dto.EarringListDTO;
import com.project.dto.ReviewDTO;

@Service
public class ReviewService {
   @Autowired
   private ReviewDAO reviewdao;
   @Autowired 
   private DressListDAO dresslistDAO;
   @Autowired 
   private EarringListDAO earringlistDAO;
   @Autowired 
   private BagListDAO baglistDAO;
   public void selectAll(Model model,String review_text) {
      ReviewDTO dto = new ReviewDTO();
      dto.setImg(review_text);
      List<ReviewDTO> arr =reviewdao.selectAll(dto);
      List<DressListDTO> l1=dresslistDAO.selectAll();
      List<EarringListDTO> l2=earringlistDAO.selectAll();
      List<BagListDTO> l3=baglistDAO.selectAll();
      String list = "상품 리스트\n\n";
      for(int i=0;i<l1.size();i++) {
         list+=l1.get(i).getProduct()+"\n";
      }
      for(int i=0;i<l2.size();i++) {
         list+=l2.get(i).getProduct()+"\n";
      }
      for(int i=0;i<l3.size();i++) {
         list+=l3.get(i).getProduct()+"\n";
      }
      model.addAttribute("review_list", arr);
      model.addAttribute("review_img",review_text);
      model.addAttribute("review_listAll",list);
   }
   
   public void select(Model model,String search_img,String type,String search_text) {
      ReviewDTO dto = new ReviewDTO();
      dto.setImg(search_img);
      List<ReviewDTO> arr = reviewdao.selectAll(dto);
      ArrayList<ReviewDTO> newarr = new ArrayList<ReviewDTO>();
      if(type.equals("subject")) {
         for(int i=0;i<arr.size();i++) {
            if(arr.get(i).getTitle().contains(search_text)) {
               System.out.println("제목");
               newarr.add(arr.get(i));
            }
         }
         model.addAttribute("review_list", newarr);
         model.addAttribute("review_img",search_img);
      }else if(type.equals("content")){
         for(int i=0;i<arr.size();i++) {
            if(arr.get(i).getContent().contains(search_text)) {
               System.out.println("내용");
               newarr.add(arr.get(i));
            }
         }
         model.addAttribute("review_list", newarr);
         model.addAttribute("review_img",search_img);
      }else if(type.equals("member_id")) {
         for(int i=0;i<arr.size();i++) {
            if(arr.get(i).getName().equals(search_text)) {
               System.out.println("id");
               newarr.add(arr.get(i));
            }
         }
         model.addAttribute("review_list", newarr);
         model.addAttribute("review_img",search_img);
      }else {
         ReviewDTO dto2 = new ReviewDTO();
         dto.setImg(search_text);
         List<ReviewDTO> arr2 = reviewdao.selectAll(dto);
         model.addAttribute("review_list", arr2);
         model.addAttribute("review_img",search_text);
      }
      List<DressListDTO> l1=dresslistDAO.selectAll();
      List<EarringListDTO> l2=earringlistDAO.selectAll();
      List<BagListDTO> l3=baglistDAO.selectAll();
      String list = "상품 리스트\n\n";
      for(int i=0;i<l1.size();i++) {
         list+=l1.get(i).getProduct()+"\n";
      }
      for(int i=0;i<l2.size();i++) {
         list+=l2.get(i).getProduct()+"\n";
      }
      for(int i=0;i<l3.size();i++) {
         list+=l3.get(i).getProduct()+"\n";
      }
      model.addAttribute("review_listAll",list);
   }
   
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
      reviewdao.insert(dto);
   }

}