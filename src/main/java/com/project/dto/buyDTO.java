package com.project.dto;

public class buyDTO {

   private String name;       //이름
   private String addr1;       //주소1        
   private String addr2;       //주소2        
   private String addr3;       //주소3        
   private String email;       //이메일   
   private String phon;      //전화번호
   private String total;       //배송비포함 총가격  
   private String sum;         //총갯수        
   private String delRequest;  //배송요청사항     
   private String ProRequest;  //제작요청사항     
   private String lPro;       //마지막값
   private String type;      //상품종류
   
   
   
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getlPro() {
      return lPro;
   }
   public void setlPro(String lPro) {
      this.lPro = lPro;
   }
   public String getPhon() {
      return phon;
   }
   public void setPhon(String phon) {
      this.phon = phon;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getAddr1() {
      return addr1;
   }
   public void setAddr1(String addr1) {
      this.addr1 = addr1;
   }
   public String getAddr2() {
      return addr2;
   }
   public void setAddr2(String addr2) {
      this.addr2 = addr2;
   }
   public String getAddr3() {
      return addr3;
   }
   public void setAddr3(String addr3) {
      this.addr3 = addr3;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getTotal() {
      return total;
   }
   public void setTotal(String total) {
      this.total = total;
   }
   public String getSum() {
      return sum;
   }
   public void setSum(String sum) {
      this.sum = sum;
   }
   public String getDelRequest() {
      return delRequest;
   }
   public void setDelRequest(String delRequest) {
      this.delRequest = delRequest;
   }
   public String getProRequest() {
      return ProRequest;
   }
   public void setProRequest(String proRequest) {
      ProRequest = proRequest;
   }
   
   
   
}