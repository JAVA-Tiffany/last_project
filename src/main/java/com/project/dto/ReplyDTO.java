package com.project.dto;

public class ReplyDTO {
   private int bno;
   private int rno;
   private String content;
   private String writer;
   private String regDate;
   private int p_rno;
   private int brno;
   
   public int getBrno() {
      return brno;
   }
   public void setBrno(int brno) {
      this.brno = brno;
   }
   public int getP_rno() {
      return p_rno;
   }
   public void setP_rno(int p_rno) {
      this.p_rno = p_rno;
   }
   public int getBno() {
      return bno;
   }
   public void setBno(int bno) {
      this.bno = bno;
   }
   public int getRno() {
      return rno;
   }
   public void setRno(int rno) {
      this.rno = rno;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public String getRegDate() {
      return regDate;
   }
   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }
   
}