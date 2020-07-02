package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String error() {
		return "login&join/alert";
	}

	@RequestMapping("loginchk")
	public String loginch(@RequestParam String id, @RequestParam String pw, HttpServletRequest request) {
		boolean chk = service.loginch(id, pw);
		if (chk == true) {

			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			System.out.println(session.getAttribute("id"));
			return "redirect:index";
		} else {
			return "redirect:login";
		}
	}

	@RequestMapping("joinok")
	public String joinok(UserDTO dto) {
		service.insert(dto);
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

	@PostMapping("design")
	public String design(@RequestParam String imgname, @RequestParam String imgmoney, Model model) {
		model.addAttribute("img_name", imgname);
		model.addAttribute("img_money", imgmoney);
		return "design/design";
	}

	@RequestMapping("tip")
	public String tip() {
		return "design/tip";
	}

	@RequestMapping(value = "userimg_insert", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String userimg_insert(HttpServletRequest request, @RequestParam String userimg_in,@RequestParam String imgname, @RequestParam String imgmoney) {
		System.out.println("userimg_in : " + userimg_in);
		System.out.println("imgname : " + imgname);
		System.out.println("imgmoney : " + imgmoney);
		cartservice.cart_insert(request, userimg_in, imgname, imgmoney);
		return "장바구니 저장 완료";
	}

	@RequestMapping("cart")
	public String cart(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("id").toString());
		List<UserimgDTO> arr = cartservice.cart_select(model,session.getAttribute("id").toString());
		System.out.println(arr.size());
		model.addAttribute("cartlist",arr);
		return "shop/cart";
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