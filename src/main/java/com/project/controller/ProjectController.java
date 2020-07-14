package com.project.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
import com.project.dto.UserDTO;
import com.project.dto.UserimgDTO;
import com.project.dto.buyDTO;
import com.project.service.ProjectService;
import com.project.service.cartService;

@Controller
public class ProjectController {
   @Autowired
   private ProjectService service;
   @Autowired
   private cartService cartservice;


   @RequestMapping("index")
   public String index_run() {
      return "default/index";
   }

   @RequestMapping("error")
   public String error(@RequestParam String num,Model model) {
      switch (num) {
      case "1":
         model.addAttribute("num",num);
         return "login&join/alert";
      case "2":
         model.addAttribute("num",num);
         return "login&join/alert";
      default:
         break;
      }
      return "login&join/alert";
   }

   @RequestMapping("loginchk")
      public String loginch(@RequestParam String id, @RequestParam String pw,HttpServletRequest request,RedirectAttributes redirectattributer) {
         boolean chk = service.loginch(id,pw);
         if(chk==true) {
            if(id.equals("admin")) {
               HttpSession session = request.getSession();
               session.setAttribute("id", id);
               session.setAttribute("pw", pw);
               
               return "redirect:adminpage";
            }else {
               HttpSession session = request.getSession();
               session.setAttribute("id", id);
               session.setAttribute("pw", pw);
               return "redirect:index";
            }
           
         }else {
            return "redirect:error?num=1";
         }
      }

   @RequestMapping("joinok")
   public String joinok(UserDTO dto) {
      try {
         service.insert(dto);
      } catch (Exception e) {
         System.out.println("동일한 아이디존재합니다");
         return "redirect:error?num=2";
      }
      
      return "redirect:index";
   }

   @RequestMapping("join")
   public String join() {
      return "login&join/join";
   }

   @RequestMapping("idch")
   public String idch(Model model, @RequestParam String id) {
      service.idch(model, id);
      return "login&join/join";
   }


   @RequestMapping("cart")
      public String cart(Model model,HttpServletRequest request) {
         HttpSession session = request.getSession();
         List<UserimgDTO> arr = cartservice.cart_select(model,session.getAttribute("id").toString());
         ArrayList<Object> arrz= new ArrayList<Object>();
         for(int i=0;i<arr.size();i++) {
            String[] z=new String[7];
            z[0]=arr.get(i).getImg();
            z[1]=arr.get(i).getId();
            z[2]=arr.get(i).getProduct();
            z[3]=arr.get(i).getCancelok();
            z[4]=arr.get(i).getMoney();
            z[5]=String.valueOf(i);
            z[6]=arr.get(i).getNum();
            arrz.add(z);
         }
         model.addAttribute("cartlist",arrz);
         return "shop/cart";
      }
      @RequestMapping("listdel")
      public String cart_delect(HttpServletRequest request, @RequestParam String img) {
         System.out.println("img : " + img);
         String[] c = img.split("/");
         String m="";
         for(int i=4;i<c.length;i++) {
            m+=c[i];
            if(c.length-1!=i) {
               System.out.println(m);
               m+="/";
            }
         }
         System.out.println("m : "+m);
         cartservice.cart_delete(request,m);
         return "redirect:cart";
      }

   
   @RequestMapping(value ="orderForm", method = {RequestMethod.GET, RequestMethod.POST})
   public String orderForm(Model model, HttpServletRequest request, @RequestParam(value="fpro", required=false) String fpro, @RequestParam(value="total", required=false) String total
         , @RequestParam(value="sum", required=false) String sum) {
      HttpSession session = request.getSession();
//      System.out.println(session.getAttribute("id"));
      List<UserimgDTO> userimglist = new ArrayList<UserimgDTO>();
      userimglist = cartservice.cart_select(model, session.getAttribute("id").toString());
      model.addAttribute("userInfo", service.buyInfo(session.getAttribute("id").toString()));
      model.addAttribute("list", userimglist);
//      System.out.println(fpro);
//      System.out.println(total);
//      System.out.println(sum);
//      model.addAttribute("fpro", fpro);
      model.addAttribute("total", total);
      model.addAttribute("sum", sum);   
      return "shop/orderForm";
   }
   
   @RequestMapping(value="buy", method =  RequestMethod.POST)
   public String buy(Model model,buyDTO buydto) {
      Date date = new Date();
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//      System.out.println(buydto.getName());
//      System.out.println(buydto.getAddr1());
//      System.out.println(buydto.getAddr2());
//      System.out.println(buydto.getAddr3());
//      System.out.println(buydto.getEmail());
//      System.out.println(buydto.getPhon());
//      System.out.println(buydto.getTotal());
//      System.out.println(buydto.getSum());
//      System.out.println(buydto.getDelRequest());
//      System.out.println(buydto.getProRequest());
//      System.out.println(buydto.getlPro());
      String[] spType = buydto.getType().split(",");
      buydto.setType(spType[0]);
      System.out.println(buydto.getType());
      model.addAttribute("buydto",buydto);
       String key="";
       String[] keylist = {"1","2","3","4","5","6","7","8","9",
               "Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
               "q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"};
       Random random = new Random();
         
         for(int i=0;i<15;i++) {
            key += keylist[random.nextInt(keylist.length)];
         }
      model.addAttribute("order_id", key);
      model.addAttribute("date", format.format(date));
      return "shop/buy";
   }
   
      @RequestMapping(value="header_review", method = RequestMethod.POST, produces = "application/text; charset=utf8")
      @ResponseBody
      public String header_review() {
         return service.header_review_list();
      }
      
      @RequestMapping("myinfo")
      public String myinfo(Model model,HttpServletRequest request) {
         service.myinfo(model, request);
         return "login&join/myinfo";
      }
      @RequestMapping("info_change")
      public String info_change(UserDTO dto) {
         service.update(dto);
         return "redirect:index";
      }
      
      @RequestMapping("data")
      public String data(Model model,@RequestParam String type) {
         service.data(model,type);
         if(type.equals("dress")) {
            return "default/dress";
         }else if(type.equals("bag")) {
            return "default/dress";
         }else {
            return "default/earring";
         }
      }
}