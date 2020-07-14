package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.DressListDTO;

@Repository
public class DressListDAO {
	@Autowired private SqlSession sqlSession;
	public static final String namepasce="com.project.mybatis.myMapper";
	public List<DressListDTO> selectAll() {
		return sqlSession.selectList(namepasce+".drselectAll_List");
	}
	
	public void updateQuantity(DressListDTO dto) {
		sqlSession.update(namepasce + ".updateQuantity",dto);
	}
}
