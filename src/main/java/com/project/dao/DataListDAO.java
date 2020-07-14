package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.DataListDTO;

@Repository
public class DataListDAO {
	@Autowired
	private SqlSession sqlSession;
	public static final String namepasce = "com.project.mybatis.myMapper";

	public List<DataListDTO> selectAll() {
		return sqlSession.selectList(namepasce + ".dataselectAll_List");
	}

	public List<DataListDTO> select(DataListDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namepasce + ".dataselect_List", dto);
	}

	public void updateQuantity(DataListDTO dto) {
		sqlSession.update(namepasce + ".updateQuantity", dto);
	}

}