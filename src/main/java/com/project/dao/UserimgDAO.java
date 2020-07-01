package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.UserimgDTO;

@Repository
public class UserimgDAO {
	@Autowired private SqlSession sqlSession;
	public static final String namepasce="com.project.mybatis.myMapper";
	public List<UserimgDTO> selectAll() {
		return sqlSession.selectList(namepasce+".selectAll_Userimg");
	}
	public UserimgDTO select(String num) {
		return sqlSession.selectOne(namepasce+".select_Userimg",num);
	}
	public int insert(UserimgDTO dto) {
		return sqlSession.insert(namepasce+".insert_Userimg",dto);
	}
	public int delete(String num) {
		return sqlSession.delete(namepasce+".delete_Userimg", num);
	}
}
