package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.MyimgDTO;

@Repository
public class MyimgDAO {
	@Autowired private SqlSession sqlSession;
	public static final String namepasce="com.project.mybatis.myMapper";
	public List<MyimgDTO> select(String id) {
		return sqlSession.selectList(namepasce+".select_Myimg",id);
	}
	public int insert(MyimgDTO dto) {
		return sqlSession.insert(namepasce+".insert_Myimg",dto);
	}
}
