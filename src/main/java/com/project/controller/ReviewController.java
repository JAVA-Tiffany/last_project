package com.project.controller;

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

import com.project.dto.ReviewDTO;
import com.project.service.ReviewService;

@Controller
public class ReviewController {
   @Autowired
   private ReviewService reviewService;
   @RequestMapping(value="review" ,method = RequestMethod.POST)
   public String review(Model model, @RequestParam() String review_text) {
      reviewService.selectAll(model,review_text);
      return "community/Review";
   }
   
   @RequestMapping(value="review_search", method = RequestMethod.POST)
   public String search(Model model,@RequestParam String search_img, @RequestParam String type, @RequestParam String search_text) {
      reviewService.select(model,search_img,type,search_text);
//      System.out.println("search_img : "+search_img);
//      System.out.println("type : "+type);
//      System.out.println("search_text : "+search_text);
      return "community/Review";
   }
   
   @RequestMapping(value="review_delect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void review_delect(@RequestParam String rno) {
      reviewService.delect(rno);
   }
   
   @RequestMapping(value="review_write" ,method = RequestMethod.POST)
   public String review_write(Model model, @RequestParam String review_img,HttpServletRequest request) {
      model.addAttribute("review_img", review_img);
      HttpSession session = request.getSession();
       
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
   public void review_save(ReviewDTO dto,MultipartHttpServletRequest request) {
	   
	   List<MultipartFile> List = request.getFiles("File");
	   
	   
	   for(MultipartFile mf : List) {
//	   String Filetype = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".")+1);
		String orgFileName = dto.getName() + "."+"png";
//		String path = "C:\\Users\\KGITBank\\Desktop\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\img\\" 
//				+ type + "\\" + orgFileName;
	   
	   
	   }
	   
	   
	   
	   
	   
	   
      reviewService.save(dto);
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
}