package com.project.controller;

import javax.servlet.http.HttpServletRequest;
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
import com.project.dto.DataListDTO;
import com.project.dto.PayDTO;
import com.project.dto.ReplyDTO;
import com.project.service.AdminService;
import com.project.service.CommunityService;
import com.project.service.ProjectService;
import com.project.service.googleChartService;

@Controller
public class AdminController {
   
   @Autowired
   ProjectService service;
   @Autowired
   CommunityService serviceCom;
   @Autowired
   AdminService serviceAdm;
   @Autowired
   private googleChartService chartservice;

   @RequestMapping(value = "/adminindex", method = {RequestMethod.GET,RequestMethod.POST})
   public String AdminPage(PayDTO dto, Model model,@RequestParam(required = false) String yer) {
      if(yer!=null)
            chartservice.Chart(dto, model,yer);
         else
            chartservice.Chart(dto, model,"2020");
         return "admin/adminindex";
   }
      
   @RequestMapping("acsearch")
   public String acsearch(Model model) {
      service.select(model);
      return "admin/Acsearch";
   }
   @RequestMapping("acboard")
   public String acboard(Model model,CommnuityDTO dto) {
       serviceCom.listAll(dto,model);
      return "admin/Acboard";
   }
   @RequestMapping(value="acboard_serch", method = RequestMethod.POST)
   public String title_search(CommnuityDTO dto, Model model, @RequestParam String type_result,@RequestParam String search_result,
         @RequestParam String start_result,@RequestParam String end_result) {
      serviceCom.title_search(dto,model,type_result,search_result,start_result,end_result);
      return "admin/Acboard";
   }
   @RequestMapping(value="acnotice_search", method = RequestMethod.POST)
   public String acnotice_search(CommnuityDTO dto, Model model, @RequestParam String type_result,@RequestParam String search_result,
         @RequestParam String start_result,@RequestParam String end_result) {
      serviceCom.notice_search(dto,model,type_result,search_result,start_result,end_result);
      return "admin/Acboard";
   }
   @RequestMapping(value="accart_search", method = RequestMethod.POST)
   public String accart_search(PayDTO dto, Model model, @RequestParam String type_result,@RequestParam String search_result,
         @RequestParam String start_result,@RequestParam String end_result) {
      serviceCom.cart_search(dto,model,type_result,search_result,start_result,end_result);
      return "admin/accart";
   }
   
   @RequestMapping("acboardIns")
   public String acboardIns() {
      return "admin/acboardIns";
   }
   @RequestMapping("save_acboardIns")
   public String save_acboardIns(CommnuityDTO dto) {
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
      serviceAdm.listAll(dto, model);
      return "admin/AcNotice";
   }
   @RequestMapping("accart")
   public String accart(Model model,AdminNoticeDTO dto,@RequestParam String start,@RequestParam String end) throws Exception{
	   System.out.println(start);
      serviceAdm.accart_list(model,start,end);
      return "admin/accart";
   }
   
   @RequestMapping("InsNotice")
   public String InsNotice() {
      return "admin/InsNotice";
   }
   @RequestMapping("save_InsNotice")
   public String save_InsNotice(AdminNoticeDTO dto,HttpSession session) {
      dto.setWriter(session.getAttribute("id").toString());
       serviceAdm.save_write(dto);
      return "redirect:acnotice";
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
   
    @RequestMapping("viewBoard")
      public String viewBoard(CommnuityDTO dto, Model model, HttpServletRequest request,HttpSession session) {
       if(session.getAttribute("id")==null) {
          model.addAttribute("logstart","로그인 해주세요");
          return "login&join/login";
       }else {
          model.addAttribute("id", session.getAttribute("id").toString());
          serviceAdm.viewBoard(dto, model);
          return "admin/AcBoardContent";
       }
         
         
      }
   
   
    @RequestMapping("categorySelect")
    public String categorySelect(@RequestParam String choice,Model model) {
       serviceAdm.choiceCategory(choice,model);
       return "admin/QuantityManage";
    }
    
    @RequestMapping("AddProductPopup")
    public String AddProductPopup() {
       return "admin/AddProductPopup";
    }
    
    
    @RequestMapping("DelProduct")
    public String DelProduct(@RequestParam String product) {
       System.out.println(product);
       serviceAdm.DelProduct(product);
       
       return "redirect:QuantityManage";
       
       
    }

}