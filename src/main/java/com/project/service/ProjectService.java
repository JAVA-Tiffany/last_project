package com.project.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.project.dao.DataListDAO;
import com.project.dao.UserDAO;
import com.project.dao.payDAO;
import com.project.dto.DataListDTO;
import com.project.dto.PayDTO;
import com.project.dto.UserDTO;

@Service
public class ProjectService {
	@Autowired
	private UserDAO userdao;

	@Autowired
	private DataListDAO datalistdao;
	@Autowired
	private payDAO dao;

	public void insert(UserDTO dto) {
		userdao.insert(dto);
	}
	public void delete(String num) {
		userdao.delete(num);
	}
	public void update(UserDTO dto) {
		userdao.update(dto);
	}
	public void select(Model model) {
		model.addAttribute("list",userdao.selectAll());
	}
	public void index(Model model) {
	      List<DataListDTO> arr = datalistdao.selectAll2();
	      ArrayList<DataListDTO> ty1= new ArrayList<DataListDTO>();
	      ArrayList<DataListDTO> ty2= new ArrayList<DataListDTO>();
	      ArrayList<DataListDTO> ty3= new ArrayList<DataListDTO>();
	      
	      Random random = new Random();
	      for(int i=0;i<arr.size();i++) {
	         if(arr.get(i).getType().equals("earring")) {
	            ty1.add(arr.get(i));
	         }
	         if(arr.get(i).getType().equals("dress")) {
	            ty2.add(arr.get(i));
	         }
	         if(arr.get(i).getType().equals("bag")) {
	            ty3.add(arr.get(i));
	         }
	      }
	      ArrayList<String> product= new ArrayList<String>();
	      ArrayList<Integer> price= new ArrayList<Integer>();
	      ArrayList<String> img= new ArrayList<String>();
	      for(int i=0;i<12;i++) {
	         if(i<4) {
	            int ran2 = random.nextInt(ty2.size());
	            product.add(ty2.get(ran2).getProduct());
	            price.add(ty2.get(ran2).getPrice());
	            img.add(ty2.get(ran2).getImg());
	            ty2.remove(ran2);
	         }else if(i<8) {
	            int ran3 = random.nextInt(ty3.size());
	            product.add(ty3.get(ran3).getProduct());
	            price.add(ty3.get(ran3).getPrice());
	            img.add(ty3.get(ran3).getImg());
	            ty3.remove(ran3);
	         }else {
	            int ran1 = random.nextInt(ty1.size());
	            product.add(ty1.get(ran1).getProduct());
	            price.add(ty1.get(ran1).getPrice());
	            img.add(ty1.get(ran1).getImg());
	            ty1.remove(ran1);
	         }
	      }
	      model.addAttribute("product", product);
	      model.addAttribute("img", img);
	      model.addAttribute("price", price);
	   }
	// 회원가입시 ID 확인
	public void idch(Model model,String id) {
		if(userdao.select(id).getId().equals(id)) {
			model.addAttribute("id_result",userdao.select(id).getId());
		}else {
			model.addAttribute("id_result","");
		}
	}

	// 로그인시 ID, PW 확인
	public boolean loginch(String id, String pw) {
		if(userdao.select(id)!=null && userdao.select(id).getId().equals(id) && userdao.select(id).getPw().equals(pw)) {
			return true;
		}else {
			return false;
		}
	}
	public void myinfo(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("myinfo_list",userdao.select(session.getAttribute("id").toString()));
	}

	public String header_review_list() {
		List<DataListDTO> arr = datalistdao.selectAll();
		return arr.get(0).getProduct();
	}


	public void data(Model model, String type,String start, String end) {
        DataListDTO dto = new DataListDTO();
        dto.setType(type);
        List<DataListDTO> l = datalistdao.select(dto);
       
        ArrayList<String> arr = new ArrayList<String>();
        ArrayList<String> arr2 = new ArrayList<String>();
        ArrayList<String> arr3 = new ArrayList<String>();
        ArrayList<String> arr4 = new ArrayList<String>();
       
        if(type.equals("earring")) {
           ArrayList<DataListDTO> newl = new ArrayList<DataListDTO>();
           int s=0;
           for (int i = 0; i < l.size(); i++) {
              if(l.get(i).getImg().contains(".webp") || l.get(i).getImg().contains(".jpg") || l.get(i).getImg().contains(".png")) {
                 newl.add(l.get(i));
                 s++;
              }
           }
           for(int i=0;i<newl.size();i++) {
              if(i>=Integer.valueOf(start) && i<Integer.valueOf(end)) {
                      arr.add("'" + newl.get(i).getImg() + "'");
                      arr2.add("'" + newl.get(i).getProduct() + "'");
                      arr3.add("'" + newl.get(i).getPrice() + "'");
                      arr4.add("'" + newl.get(i).getCount() + "'");
                }
           }
           model.addAttribute("list_size",s);
        }else {
           for (int i = 0; i < l.size(); i++) {
              if(i>=Integer.valueOf(start) && i<Integer.valueOf(end)) {
                      arr.add("'" + l.get(i).getImg() + "'");
                      arr2.add("'" + l.get(i).getProduct() + "'");
                      arr3.add("'" + l.get(i).getPrice() + "'");
                      arr4.add("'" + l.get(i).getCount() + "'");
                }
           }
           model.addAttribute("list_size",l.size());
        }
        
        model.addAttribute("list_img", arr);
        model.addAttribute("list_product", arr2);
        model.addAttribute("list_price", arr3);
        model.addAttribute("list_count", arr4);
        model.addAttribute("list_type",type);
        model.addAttribute("list_last", end);
     }

	public void earring_list(Model model,String imgname) {
	      List<DataListDTO> arr=datalistdao.selectAll2();
	      ArrayList<String> newarr1=new ArrayList<String>();
	      ArrayList<String> newarr2=new ArrayList<String>();
	      ArrayList<String> newarr3=new ArrayList<String>();
	      for(int i=0;i<arr.size();i++) {
	         String[] cut = imgname.split("/");
	         String ss="";
	         for(int x=0;x<cut.length;x++) {
	            ss+=cut[x];
	            if(x!=cut.length-1) {
	               ss+="_";
	            }
	         }
	         System.out.println(arr.get(i).getImg());
	         if(arr.get(i).getImg().split("/")[3].contains("png") 
	               && arr.get(i).getImg().split("/")[3].contains(ss)) {
	            arr.get(i).setProduct(ss);
	            newarr1.add("'"+arr.get(i).getImg()+"'");
	            newarr2.add("'"+arr.get(i).getProduct()+"'");
	            newarr3.add("'"+arr.get(i).getPrice()+"'");
	         }
	      }
	      model.addAttribute("earring_list_img",newarr1);
	      model.addAttribute("earring_list_price",newarr3);
	      model.addAttribute("earring_list_product",newarr2);
	   }
	   
	public UserDTO buyInfo(String id) {
		return userdao.select(id);
	}

	  public void orderlist(Model model,HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      PayDTO dto = new PayDTO();
	      dto.setId(session.getAttribute("id").toString());
	      model.addAttribute("order_list", dao.order_list(dto));
	   }
}