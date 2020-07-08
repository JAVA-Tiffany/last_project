package com.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.UserDTO;
import com.project.service.AdminService;
import com.project.service.CommunityService;
import com.project.service.ProjectService;

@Controller
public class AdminController {
	
	@Autowired
	ProjectService service;
	@Autowired
	CommunityService serviceCom;
	@Autowired
	AdminService serviceAdm;
	
	@RequestMapping("adminpage")
	public String AdminPage() {
			return "admin/adminpage";
	}
		
	@RequestMapping("acsearch")
	public String acsearch(Model model) {
		service.select(model);
		return "admin/Acsearch";
	}
	@RequestMapping("acboard")
	public String acboard(Model model,CommnuityDTO dto) {
		 serviceCom.listAll(dto,model);
		return "admin/Acboard";
	}
	
	@RequestMapping("DelUser")
	public String DelUser(@RequestParam String idval) {
		System.out.println(idval);
		String[] arr = idval.split(" ");
		for(int i=0;i<arr.length;i++) {
			service.delete(arr[i]);
		}
		
		return "redirect:acsearch";
	}
	
	@RequestMapping("DelBoard")
	public String DelBoard(@RequestParam String num) {
		String[] arr = num.split(" ");
		for(int i=0;i<arr.length;i++) {
			serviceCom.delete(Integer.parseInt(arr[i]));
		}
		
		return "redirect:acboard";
	}
	
	@RequestMapping("acnotice")
	public String acnotice(Model model,AdminNoticeDTO dto) {
		serviceAdm.listAll(dto, model);
		return "admin/AcNotice";
	}
	
	@RequestMapping("InsNotice")
	public String InsNotice() {
		
		return "admin/InsNotice";
	}
	
	@RequestMapping("save_Notice")
	public String save_Notice(AdminNoticeDTO dto) {
		 serviceAdm.save_write(dto);
		return "redirect:acnotice";
	}
	
	
	
	@RequestMapping("NoticeContent")
	   public String view(AdminNoticeDTO dto, Model model) {
	      serviceAdm.count(dto);
	      serviceAdm.view(dto,model);
	      return "admin/NoticeContent";
	   }
	
	@RequestMapping("DelNotice")
	public String DelNotice(@RequestParam String num) {
		String[] arr = num.split(" ");
		for(int i=0;i<arr.length;i++) {
			serviceAdm.delete(Integer.parseInt(arr[i]));
		}
		
		return "redirect:acnotice";
	}
	
	
	



}
