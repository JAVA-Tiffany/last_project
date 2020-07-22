package com.project.dto;

public class ReviewDTO {
   private int rno;
   private String name;
   private String content;
   private int infocount;
   private String regdat;
   private String img;
   private String title;
   private String path;
   
   
   public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
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