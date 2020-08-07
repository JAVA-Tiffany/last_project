package com.project.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MyimgDAO;
import com.project.dto.MyimgDTO;


@Service
public class MyimgService {
	@Autowired
	private MyimgDAO myimgdao;
	public List<MyimgDTO> select(String id){
		return myimgdao.select(id);
	}
	public void insert(MyimgDTO dto) {
		myimgdao.insert(dto);
	}
	public void myimg_delete(String id, String img) {
		MyimgDTO dto = new MyimgDTO();
		dto.setId(id);
		dto.setImg("'"+img+"'");
		myimgdao.delect(dto);
		// 삭제할 파일 경로
		File file = new File("D:\\yoo\\WorkSpace\\last_project\\src\\main\\webapp\\resources\\userimg\\"+img); 
		if( file.exists() ){ 
			if(file.delete()) { 
				System.out.println("내 이미지 파일삭제 성공"); 
			}else{ 
				System.out.println("내 이미지 파일삭제 실패"); 
			} 
		}else{ 
			System.out.println("파일이 존재하지 않습니다."); 
		}
	}
}
