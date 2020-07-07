package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.CommnuityDTO;
import com.project.dto.ReplyDTO;
import com.project.service.CommunityService;
import com.project.service.ReplyService;

@Controller
public class CommunityController {
   
   @Inject
   CommunityService service;
   
   @Autowired
   private ReplyService replyService;
   
   @RequestMapping("list")
   public String list(CommnuityDTO dto, Model model) {
      service.listAll(dto,model);
      
      return "community/list";

   }
   
   @RequestMapping(value="view", method = {RequestMethod.GET, RequestMethod.POST})
   public String view(CommnuityDTO dto, Model model, HttpServletRequest request) {
      service.count(dto);
      service.view(dto,model);
      List<ReplyDTO> arr = replyService.select(dto.getBno());
      ArrayList<String> a1=new ArrayList<String>();
      ArrayList<String> a2=new ArrayList<String>();
      ArrayList<String> a4=new ArrayList<String>();
      for(int i=0;i<arr.size();i++) {
    	  a1.add("'"+arr.get(i).getWriter()+"'");
    	  String[] z=arr.get(i).getContent().split("");
    	  String sum="";
    	  int a=0;
    	  for(int x=0;x<z.length-1;x++) {
    		  if(z[x+1].equals("\n")) {
    			  sum+="'"+"\n+'";
    			  a=1;
    		  }else {
    			  if(a==0) {
    				  sum+=z[x];
    			  }else {
    				  a=0;
    			  }
    		  }
    	  }
    	  arr.get(i).setContent(sum);
    	  a2.add("'"+arr.get(i).getContent()+"'");
    	  a4.add("'"+arr.get(i).getRegDate()+"'");
      }
      model.addAttribute("writer_view", a1);
      model.addAttribute("comment_view", a2);
      model.addAttribute("bno_view", dto.getBno());
      model.addAttribute("regDate_view", a4);
      HttpSession session = request.getSession();
      model.addAttribute("id", session.getAttribute("id").toString());
      return "community/view";
   }
   @RequestMapping(value="reply", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public String reply(@RequestParam String bno,@RequestParam String comnet,@RequestParam String writer) {
	   ReplyDTO dto = new ReplyDTO();
	   dto.setBno(Integer.valueOf(bno));
	   dto.setContent(comnet);
	   dto.setWriter(writer);
	   replyService.insert(dto);
	   return "댓글 입력";
   }
   
   @RequestMapping("write")
   public String write() {
      return "community/write";
   }
   
   @RequestMapping("save_write")
   public String save_write(CommnuityDTO dto) {
      service.save_write(dto);
      return "redirect:list";
   }
   
   
   
   @RequestMapping("update")
   public String update(CommnuityDTO dto,Model model) {
      service.update(dto,model);
      return "community/update";
   }
   
   @RequestMapping("update_save")
   public String update_sava(CommnuityDTO dto) {
      service.update_save(dto);
      return "redirect:list";
   }
   
   @RequestMapping("delete")
   public String delete(CommnuityDTO dto) {
      service.delete(dto);
      return "redirect:list";
   }
   
   
   @RequestMapping("notice")
   public String notice() {
      return "community/notice";
   }
   
   @RequestMapping("review")
   public String review() {
      return "community/Review";
   }
   
}