package com.project.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class makePngFileService {
	public String makePngFile(String imgbase64) {
		/**
		 * imgbase64 (imgbase64data:image/png;base64,iVBORw0KGgoAA 로 시작)
		 * saveFilePath (저장경로)
		 * savename (파일이름)
		 */ 
		try {
			//현재 날짜 시간 데이터 만들기
	        Date today = new Date ();
	        SimpleDateFormat fomat = new SimpleDateFormat("yyyyMMddHHmmss");
	        
	        String savename = fomat.format(today);
	        
			// create a buffered image
			BufferedImage image = null;

//			System.out.println(imgbase64);
			byte[] imageByte = Base64.getDecoder().decode(imgbase64);
			
			ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
			image = ImageIO.read(bis);
			bis.close();
			
			// write the image to a file
			File outputfile = new File("D:\\yoo\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\userimg\\" + savename + ".png");
//			System.out.println(image);
			System.out.println(outputfile);
			ImageIO.write(image, "png", outputfile); // 파일생성
			return savename+".png";
		} catch (IOException e) {
			
		}
		return null;
		
	}
}
