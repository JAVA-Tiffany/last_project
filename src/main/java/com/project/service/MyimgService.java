package com.project.service;

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
}
