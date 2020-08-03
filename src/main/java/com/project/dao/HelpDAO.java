package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.HelpDTO;

@Repository
public class HelpDAO {
	
	@Autowired
	private SqlSession sqlSession;
	   
	public static final String namepasce="com.project.mybatis.myMapper";
	
	public List<HelpDTO> list(){
		return sqlSession.selectList(namepasce+".select_order_pay");
	}
	
	
}
