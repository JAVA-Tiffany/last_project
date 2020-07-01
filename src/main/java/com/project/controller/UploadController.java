package com.project.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.service.makePngFileService;
 
@Controller
public class UploadController {
	@Autowired
	private makePngFileService service;
	
	@RequestMapping(value="makeFile",method = RequestMethod.POST, produces = "application/text; charset=utf8")
    @ResponseBody
    public String makeFile(@RequestParam String imgbase64){
//    	System.out.println("imgbase64 : "+imgbase64);
    	return service.makePngFile(imgbase64);
    }
	
//	@Autowired
//	private HttpSession session;
//	
//    @Resource(name="uploadPath")
//    private String uploadPath; //업로드된 파일 저장 경로
//    
//    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
//    
//    @RequestMapping(value="fileUpload", method = RequestMethod.POST, produces = "application/text; charset=utf8")
//    @ResponseBody
//    public MultipartFile upload(MultipartFile file,Model model)throws Exception{
//    	System.out.println("file.getName : " + file.);
//        //저장된 파일 이름
//        String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
//        return file;
//    }
//    
//    private String uploadFile(String originName, byte[] fileData)throws Exception{
//        
//        //현재 날짜 시간 데이터 만들기
//        Date today = new Date ();
//        SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmmss");
//        
//        //현재 날짜 시간 데이터에 오리진 이름 합쳐서 파일명을 설정
//        String savedName = fomat.format(today) + "_"+originName;
//        
//        logger.info("savedName : "+savedName);
//        
//        //저장할 파일 객체 생성
//        File target = new File(uploadPath,savedName);
//        
//        //파일을 복사(데이터, 경로)
//        FileCopyUtils.copy(fileData, target);
//        
//        return savedName;
//    }
    
}
