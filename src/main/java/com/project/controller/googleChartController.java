package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.PayDTO;
import com.project.service.googleChartService;

@Controller
public class googleChartController {
   
   @Autowired
   private googleChartService service;
   
   @RequestMapping(value = "Chart", method = {RequestMethod.GET,RequestMethod.POST})
   public String Chart(PayDTO dto, Model model,@RequestParam(required = false) String yer) {
      if(yer!=null)
         service.Chart(dto, model,yer);
      else
         service.Chart(dto, model,"2020");
      return "default/Chart";
   }

   
   @RequestMapping("googleChart")
   public String googleChart() {
      return "default/googleChart";
   }
   
   
}