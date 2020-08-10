package com.project.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class UtilFile {
    String fileName = "";


	//  fileUpload() 메소드에서 전체 경로를 DB에 경로 그대로 저장 한다.  
    public String fileUpload(MultipartHttpServletRequest request,
    MultipartFile uploadFile, Object obj,HttpServletRequest reqest2,String type,String product) {
        String path = "";
        String fileName = "";

        OutputStream out = null;
        PrintWriter printWriter = null;

        try {
        	String name = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf(".")+1);
        	System.out.println(name);
        	fileName =product +"."+ name;
            byte[] bytes = uploadFile.getBytes();
            path  ="D:\\workspace-project\\last_project\\src\\main\\webapp\\resources\\img\\" + type + "\\";

            File file = new File(path+ fileName);

            // 파일명이 중복체크
            if (fileName != null && !fileName.equals("")) {
                if (file.exists()) {
            // 파일명 앞에 구분(예)업로드 시간 초 단위)을 주어 파일명 중복을 방지한다.
                	fileName =product +"."+ name;
                file = new File(path + fileName);
                }
            }
            out = new FileOutputStream(file);

            out.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return path + fileName;
    }
    
    
    
    
    public String fileUpload2(MultipartHttpServletRequest request,
    	    MultipartFile uploadFile, Object obj,HttpServletRequest reqest2,String type,String product) {
    	        String path = "";
    	        String fileName = "";

    	        OutputStream out = null;
    	        PrintWriter printWriter = null;

    	        try {
    	        	
    	            
    	            String name = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().lastIndexOf(".")+1);
    	        	System.out.println(name);
    	        	fileName =product +"."+ name;
    	            byte[] bytes = uploadFile.getBytes();
    	            String retype=type.replace("pitting", "design");
    	            path  ="C:\\Users\\KGITBank\\Desktop\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\img\\" + retype + "\\";
    	            File file = new File(path+ fileName);

    	            // 파일명이 중복체크
    	            if (fileName != null && !fileName.equals("")) {
    	                if (file.exists()) {
    	            // 파일명 앞에 구분(예)업로드 시간 초 단위)을 주어 파일명 중복을 방지한다.
    	                	fileName =product +"."+ name;
    	                file = new File(path + fileName);
    	                }
    	            }
    	            out = new FileOutputStream(file);

    	            out.write(bytes);
    	        } catch (Exception e) {
    	            e.printStackTrace();
    	        } finally {
    	            try {
    	                if (out != null) {
    	                    out.close();
    	                }
    	                if (printWriter != null) {
    	                    printWriter.close();
    	                }
    	            } catch (IOException e) {
    	                e.printStackTrace();
    	            }
    	        }
    	        return path + fileName;
    	    }
}