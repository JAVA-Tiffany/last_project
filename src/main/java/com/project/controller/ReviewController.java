package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.ReviewDAO;
import com.project.dto.ReviewDTO;
import com.project.service.ReviewService;

@Controller
public class ReviewController {
   @Autowired
   private ReviewService reviewService;
   @Autowired
   private ReviewDAO reviewdao;
   
   @RequestMapping(value="review" )
   public String review(Model model) {
      reviewService.selectAll(model);
      
      return "community/Review";
   }
   
//   @RequestMapping(value="review_search", method = RequestMethod.POST)
//   public String search(Model model,@RequestParam String search_img, @RequestParam String type, @RequestParam String search_text) {
//      reviewService.select(model,search_img,type,search_text);
//      System.out.println("search_img : "+search_img);
//      System.out.println("type : "+type);
//      System.out.println("search_text : "+search_text);
//      return "community/Review";
//   }
   
   @RequestMapping(value="review_delect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void review_delect(@RequestParam String rno) {
      reviewService.delect(rno);
   }
   
   @RequestMapping(value="review_write" ,method = RequestMethod.POST)
   public String review_write(Model model, @RequestParam String review_img,HttpServletRequest request, @RequestParam String type,@RequestParam String pay_rno,@RequestParam String in_ch) {
      ArrayList<String> filelist = new ArrayList<String>();
     System.out.println(review_img);
      System.out.println(type);
      model.addAttribute("review_img", review_img);
      model.addAttribute("type", type);
      model.addAttribute("pay_rno", pay_rno);
      System.out.println(in_ch);
      if(in_ch.equals("리뷰수정")) {
         ReviewDTO dto = new ReviewDTO();
         dto.setPay_rno(pay_rno);
         ReviewDTO arr = reviewdao.select(dto);
         System.out.println(arr.getTitle());
         System.out.println(arr.getContent());
         model.addAttribute("title", arr.getTitle());
         model.addAttribute("content", arr.getContent());
         if(arr.getFileimg()!=null) {
            String[] arra = arr.getFileimg().split(",");
            for(int i=0;i<arra.length;i++) {
               filelist.add("'"+arra[i]+"'");
            }
         }
         model.addAttribute("fileimg",filelist);
         model.addAttribute("rno", arr.getRno());
         
      }else {
         model.addAttribute("title", "");
         model.addAttribute("content", "");
         model.addAttribute("fileimg", filelist);
         model.addAttribute("rno", "");
      }
      model.addAttribute("in_ch", in_ch);
      HttpSession session = request.getSession();
       
//      reviewService.
       if(session.getAttribute("id")==null) {
          model.addAttribute("logstart","로그인 해주세요");
          return "login&join/login";
       }else {
          model.addAttribute("id", session.getAttribute("id").toString());
          return "community/review_write";
       }
   }
   
   
   @RequestMapping(value="review_save" ,method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void review_save(HttpServletRequest re,MultipartHttpServletRequest request, @RequestParam("img") String img, @RequestParam("infocount") int infocount,
                        @RequestParam("name") String name, @RequestParam("title") String title, @RequestParam("content") String content,@RequestParam String pay_rno, @RequestParam String type,@RequestParam String in_ch,@RequestParam Integer rno) {
      System.out.println(content);
     ReviewDTO dto = new ReviewDTO();
      HttpSession session = re.getSession();
      
      dto.setName((String) session.getAttribute("id"));
      dto.setContent(content);
      dto.setInfocount(infocount);
      dto.setImg(img);
      dto.setTitle(title);
      dto.setPay_rno(pay_rno);
      dto.setType(type);
      
      List<MultipartFile> fileList = request.getFiles("fileimg");
      
      String path = "C:\\Users\\KGITBank\\Desktop\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\Review\\";
      String img_list="";
      if(fileList.size()==0) {
         dto.setFileimg("");
         if(in_ch.equals("리뷰수정")) {
            dto.setRno(rno);
            reviewService.update_nofileimg(dto);
          }else {
             reviewService.save(dto);
          }
      }else {
      for(int i=0;i<fileList.size();i++) {
         String originFileNmae = fileList.get(i).getOriginalFilename();
         long fileSize = fileList.get(i).getSize();
         
       //현재 날짜 시간 데이터 만들기
         Date today = new Date ();
         SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmmss");
         
         System.out.println("originFileNmae :"+  originFileNmae);
         System.out.println("fileSize :"+  fileSize);
         
         if(!originFileNmae.equals("")) {
            String safeFile = path + fomat.format(today) + originFileNmae;
            img_list+="resources/Review/" +fomat.format(today) + originFileNmae;
            if(i!=fileList.size()-1) {
               img_list+=",";
            }
            dto.setFileimg(img_list);
            if(i==fileList.size()-1) {
               if(in_ch.equals("리뷰수정")) {
                  dto.setRno(rno);
                  reviewService.update(dto);
                }else {
                   reviewService.save(dto);
                }
            }
            try {
               fileList.get(i).transferTo(new File(safeFile));
         } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
         }
         }else {
            dto.setFileimg(img_list);
            if(i==fileList.size()-1) {
               if(in_ch.equals("리뷰수정")) {
                  dto.setRno(rno);
                  reviewService.update_nofileimg(dto);
                }else {
                   reviewService.save(dto);
                }
            }
         }


      }
      }
   }
   
   
   
   @RequestMapping(value="infocount_up", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void infocount_up(@RequestParam String rno) {
      reviewService.update_info(rno);
   }
   
   @RequestMapping(value="review_update", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void infocount_up(ReviewDTO dto) {
      reviewService.update(dto);
   }
   
   @RequestMapping(value="category_list", produces = "application/text; charset=utf8")
   public String category_list(Model model,@RequestParam String type) {
      reviewService.categoryList(model,type);

      return "community/Review";
   }
   
   
}