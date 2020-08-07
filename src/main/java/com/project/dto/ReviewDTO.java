package com.project.dto;

import java.util.ArrayList;

public class ReviewDTO {
   private int rno;
   private String name;
   private String content;
   private int infocount;
   private String regdat;
   private String img;
   private String title;
   private String fileimg;
   private String type;
   private String pay_rno;
   private String fileimg2;
   
   
   
   
   
   public String getFileimg2() {
	   
	   String[] dd=null;
	   fileimg2 = "[";
	   if(fileimg!=null) {
	      dd=fileimg.split(",");
	      for(int i =0;i < dd.length;i++) {
	            if(i == dd.length-1) {
	               fileimg2 +="'"+dd[i]+"']";
	            }else {
	               fileimg2 += "'"+dd[i]+"',";
	            }
	         }
	   }else {
	      fileimg2+="]";
	   }
	   return fileimg2;
	}

public void setFileimg2(String fileimg2) {
   this.fileimg2 = fileimg2;
}

public String getPay_rno() {
      return pay_rno;
   }

   public void setPay_rno(String pay_rno) {
      this.pay_rno = pay_rno;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getFileimg() {
      return fileimg;
   }

   public void setFileimg(String fileimg) {
      this.fileimg = fileimg;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getImg() {
      return img;
   }

   public void setImg(String img) {
      this.img = img;
   }

   public int getRno() {
      return rno;
   }

   public void setRno(int rno) {
      this.rno = rno;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public int getInfocount() {
      return infocount;
   }

   public void setInfocount(int infocount) {
      this.infocount = infocount;
   }

   public String getRegdat() {
      return regdat;
   }

   public void setRegdat(String regdat) {
      this.regdat = regdat;
   }

   

}