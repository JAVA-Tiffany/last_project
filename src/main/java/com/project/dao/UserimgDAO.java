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
	public List<UserimgDTO> select(String name) {
		return sqlSession.selectList(namepasce+".select_Userimg",name);
	}
	public int insert(UserimgDTO dto) {
		return sqlSession.insert(namepasce+".insert_Userimg",dto);
	}
	public int delete(UserimgDTO dto) {
		return sqlSession.delete(namepasce+".delete_Userimg", dto);
	}
	public int update(UserimgDTO dto) {
		return sqlSession.update(namepasce+".update_Userimg", dto);
	}
	public int update_Count(UserimgDTO dto) {
		return sqlSession.update(namepasce+".update_Count", dto);
	}
	public int update_Countd(UserimgDTO dto) {
		return sqlSession.update(namepasce+".update_Count-1", dto);
	}
}
