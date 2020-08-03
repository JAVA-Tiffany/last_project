package com.project.dto;

public class DataListDTO {
   private String img;
   private String product;
   private int price;
   private int count;
   private int quantity;
   private String type;
   private String start;
   private String end;
   private String num;
   private String cnt;
   
   
   public String getCnt() {
	return cnt;
}
public void setCnt(String cnt) {
	this.cnt = cnt;
}
public String getStart() {
	return start;
}
public void setStart(String start) {
	this.start = start;
}
public String getEnd() {
	return end;
}
public void setEnd(String end) {
	this.end = end;
}
public String getNum() {
	return num;
}
public void setNum(String num) {
	this.num = num;
}
public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
   public String getImg() {
      return img;
   }
   public void setImg(String img) {
      this.img = img;
   }
   public String getProduct() {
      return product;
   }
   public void setProduct(String product) {
      this.product = product;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public int getCount() {
      return count;
   }
   public void setCount(int count) {
      this.count = count;
   }
}