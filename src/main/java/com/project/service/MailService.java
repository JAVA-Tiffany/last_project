package com.project.service;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.UserDAO;
import com.project.dto.UserDTO;

@Service
public class MailService {
   @Autowired
   private JavaMailSender mailSender;
   @Autowired
   private UserDAO userdao;
   
   public String mailSending(String eamil) {
      String setfrom = "ejrtn153@gmail.com";
      String keye=null;
      try {
         MimeMessage message = mailSender.createMimeMessage();
         MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

         messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
         messageHelper.setTo(eamil); // 받는사람 이메일
         messageHelper.setSubject("self design 인증번호");
         keye=key();
         String msg="<h1>인증 번호를 입력해 주세요.</h1><br>"
               + "<h1>인증번호 : "+keye+"</h1>";
         messageHelper.setText(msg,true); // 메일 내용

         mailSender.send(message);
      } catch (Exception e) {
         System.out.println(e);
      }
      return keye;
   }
   public String key() {
      String key="";
      String[] keylist = {"1","2","3","4","5","6","7","8","9",
            "Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
            "q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"};
      Random random = new Random();
      
      for(int i=0;i<8;i++) {
         key += keylist[random.nextInt(keylist.length)];
      }
      System.out.println(key);
      return key;
   }
   public String idsearch(String name,String mail) {
      String s="";
      UserDTO dto =new UserDTO();
      dto.setName(name);
      dto.setEmail(mail);
      List<UserDTO> arr = userdao.selectid(dto);
      for(int i=0;i<arr.size();i++) {
         s+="ID : "+arr.get(i).getId()+"\n";
      }
      return s;
   }
   public String pwsearch(String name,String mail) {
      String s="";
      UserDTO dto =new UserDTO();
      dto.setId(name);
      dto.setEmail(mail);
      List<UserDTO> arr = userdao.selectpw(dto);
      for(int i=0;i<arr.size();i++) {
         s+="ID : "+arr.get(i).getId()+"\n";
      }
      return s;
   }
   public void myinfo(Model model, String id) {
       model.addAttribute("myinfo_list",userdao.select(id));
   }
}