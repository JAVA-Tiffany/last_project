package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.service.cartService;

@RestController
public class restController {
   
   @Autowired
   private cartService cartservice;
   
   @GetMapping(value="num_up", produces="application/text;charset=utf-8")
   @ResponseBody
   public String unm_up(HttpServletRequest request, @RequestParam int num, @RequestParam String product) {
      HttpSession se = request.getSession();
      cartservice.cart_update(se.getAttribute("id").toString(),num, product);
      return "뭐든되라";
   }
   
   @GetMapping(value="num_down", produces="application/text;charset=utf-8")
   public String unm_down(HttpServletRequest request, @RequestParam int num, @RequestParam String product) {
      System.out.println(num);
      System.out.println(product);
      HttpSession se = request.getSession();
      System.out.println(se.getAttribute("id"));
      cartservice.cart_update2(se.getAttribute("id").toString(),num, product);
      return "이거머임?2";
   }
}