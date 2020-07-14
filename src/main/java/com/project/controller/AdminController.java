package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.service.AdminService;
import com.project.service.CommunityService;
import com.project.service.ProjectService;

@Controller
public class AdminController {
   
   @Autowired
   ProjectService service;
   @Autowired
   CommunityService serviceCom;
   @Autowired
   AdminService serviceAdm;
   

   @RequestMapping("adminpage")
   public String AdminPage() {
         return "admin/adminpage";
   }
      
   @RequestMapping("acsearch")
   public String acsearch(Model model) {
      service.select(model);
      return "admin/Acsearch";
   }
   @RequestMapping("acboard")
   public String acboard(Model model,CommnuityDTO dto) {
      serviceCom.adminview(dto, model);
       serviceCom.listAll(dto,model);
      return "admin/Acboard";
   }
   
   @RequestMapping("acboardIns")
   public String acboardIns() {
      return "admin/acboardIns";
   }
   
   @RequestMapping("save_acBoard")
   public String save_acBoard(CommnuityDTO dto) {
      serviceAdm.save_writeBoard(dto);
      return "redirect:acboard";
      
   }
   
   @RequestMapping("DelUser")
   public String DelUser(@RequestParam String idval) {
      System.out.println(idval);
      String[] arr = idval.split(" ");
      for(int i=0;i<arr.length;i++) {
         service.delete(arr[i]);
      }
      
      return "redirect:acsearch";
   }
   
   @RequestMapping("DelBoard")
   public String DelBoard(@RequestParam String num) {
      String[] arr = num.split(" ");
      for(int i=0;i<arr.length;i++) {
         serviceAdm.deleteQA(Integer.parseInt(arr[i]));
      }
      
      return "redirect:acboard";
   }
   
   @RequestMapping("acnotice")
   public String acnotice(Model model,AdminNoticeDTO dto) {
      serviceAdm.adminList(dto,model);
      serviceAdm.listAll(dto, model);
      return "admin/AcNotice";
   }
   
   @RequestMapping("InsNotice")
   public String InsNotice() {
      
      return "admin/InsNotice";
   }
   
   @RequestMapping("save_Notice")
   public String save_Notice(AdminNoticeDTO dto,HttpSession session) {
      dto.setWriter(session.getAttribute("id").toString());
       serviceAdm.save_write(dto);
      return "redirect:acnotice";
   }
   
   
   
   @RequestMapping("NoticeContent")
   public String view(AdminNoticeDTO dto, Model model,@RequestParam("bno") Integer bno) {
      System.out.println(dto.getBno());


      System.out.println(bno + "bno check");
      dto.setBno(bno);
      
      serviceAdm.view(dto,model);


      return "admin/NoticeContent";
   }
   
   @RequestMapping("DelNotice")
   public String DelNotice(@RequestParam String num) {
      String[] arr = num.split(" ");
      for(int i=0;i<arr.length;i++) {
         serviceAdm.delete(Integer.parseInt(arr[i]));
      }
      return "redirect:acnotice";
   }
   
   @RequestMapping("ModifyNotice")
   public String ModefyNotice(AdminNoticeDTO dto, Model model) {
      serviceAdm.view(dto,model);
      return "admin/ModifyNotice";
   }
   
   @RequestMapping("ModifyNoticeSave")
   public String ModifyNoticeSave(AdminNoticeDTO dto, Model model,RedirectAttributes redirect) {
      System.out.println(dto.getBno() + "save");
      serviceAdm.ModifySave(dto);
      System.out.println(dto.getBno() + "save2");
      redirect.addAttribute("bno",dto.getBno());
      return "redirect:NoticeContent";
   }
   
   @RequestMapping("ReViewNotice")
   public String ReViewNotice(AdminNoticeDTO dto, Model model) {
      serviceAdm.view(dto,model);
      return "admin/NoticeContent";
   }
   
   @RequestMapping("QuantityManage")
   public String QuantityManage(Model model) {
      serviceAdm.selectAllQuantity(model);
      
      return "admin/QuantityManage";
      
   }
   
   @RequestMapping(value = "modifyQuantity", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public void modifyQuantity(@RequestParam String product,@RequestParam String quantity,@RequestParam String type) {
      System.out.println(product+ quantity + type);
      serviceAdm.updateQuantity(product, quantity,type);
      
   }


}