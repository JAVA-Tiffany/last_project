package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.dto.UserDTO;
import com.project.dto.UserimgDTO;
import com.project.service.ProjectService;
import com.project.service.cartService;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService service;
	@Autowired
	private cartService cartservice;


	@RequestMapping("index")
	public String index_run() {
		return "default/index";
	}

	@RequestMapping("error")
	public String error(@RequestParam String num,Model model) {
		switch (num) {
		case "1":
			model.addAttribute("num",num);
			return "login&join/alert";
		case "2":
			model.addAttribute("num",num);
			return "login&join/alert";
		default:
			break;
		}
		return "login&join/alert";
	}

	@RequestMapping("loginchk")
	   public String loginch(@RequestParam String id, @RequestParam String pw,HttpServletRequest request,RedirectAttributes redirectattributer) {
	      boolean chk = service.loginch(id,pw);
	      if(chk==true) {
	    	  if(id.equals("admin")) {
	    		  HttpSession session = request.getSession();
	    		  session.setAttribute("id", id);
	    		  session.setAttribute("pw", pw);
	    		  
	    		  return "redirect:adminpage";
	    	  }else {
	    		  HttpSession session = request.getSession();
	    		  session.setAttribute("id", id);
	    		  session.setAttribute("pw", pw);
	    		  return "redirect:index";
	    	  }
	        
	      }else {
	         return "redirect:error?num=1";
	      }
	   }

	@RequestMapping("joinok")
	public String joinok(UserDTO dto) {
		try {
			service.insert(dto);
		} catch (Exception e) {
			System.out.println("동일한 아이디존재합니다");
			return "redirect:error?num=2";
		}
		
		return "redirect:index";
	}

	@RequestMapping("join")
	public String join() {
		return "login&join/join";
	}

	@RequestMapping("idch")
	public String idch(Model model, @RequestParam String id) {
		service.idch(model, id);
		return "login&join/join";
	}

	

	@RequestMapping("cart")
	public String cart(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<UserimgDTO> arr = cartservice.cart_select(model,session.getAttribute("id").toString());
		ArrayList<Object> arrz= new ArrayList<Object>();
		if(arr!=null) {
			for(int i=0;i<arr.size();i++) {
				String[] z=new String[6];
				z[0]=arr.get(i).getImg();
				z[1]=arr.get(i).getId();
				z[2]=arr.get(i).getProduct();
				z[3]=arr.get(i).getCancelok();
				z[4]=arr.get(i).getMoney();
				z[5]=String.valueOf(i);
				arrz.add(z);
			}
		}
		model.addAttribute("cartlist",arrz);
		return "shop/cart";
	}
	@RequestMapping("listdel")
	public String cart_delect(HttpServletRequest request, @RequestParam String img) {
		System.out.println("img : " + img);
		String[] c = img.split("/");
		String m="";
		for(int i=4;i<c.length;i++) {
			m+=c[i];
			if(c.length-1!=i) {
				m+="/";
			}
		}
		System.out.println("m : "+m);
		cartservice.cart_delete(request,m);
		return "redirect:cart";
	}

	@RequestMapping("dress")
	public String dress(Model model) {
		service.dress(model);
		return "default/dress";
	}

	@RequestMapping("earring")
	public String earring(Model model) {
		service.earring(model);
		return "default/earring";
	}

	@RequestMapping("bag")
	public String bag(Model model) {
		service.bag(model);
		return "default/bag";
	}
}