package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.MailService;

@Controller
public class MailController {

   @Autowired
   private MailService mailService;

   // mailSending 코드
   @RequestMapping(value="mailSending", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public String mailSending(@RequestParam String email) {
      return mailService.mailSending(email);
   }
   
   @RequestMapping(value = "infosearch")
   public String infosearch() {
      return "login&join/IDorPWsearch";
   }
   
   @RequestMapping(value = "pwsearch", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public String pwsearch(@RequestParam String name,@RequestParam String mail) {
      return mailService.pwsearch(name,mail);
   }
   
   @RequestMapping(value="pwinfo")
   public String myinfo(Model model,@RequestParam String pwform_text) {
      mailService.myinfo(model, pwform_text);
      return "login&join/myinfo";
   }
   
   @RequestMapping(value="idsearch", method = RequestMethod.POST, produces = "application/text; charset=utf8")
   @ResponseBody
   public String idsearch(@RequestParam String name,@RequestParam String mail) {
      return mailService.idsearch(name,mail);
   }
}