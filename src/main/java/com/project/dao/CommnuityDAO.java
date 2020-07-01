package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.dto.CommnuityDTO;

@Repository
public class CommnuityDAO {
	@Inject
	private SqlSession sqlSession;

	
	public static final String namepasce="com.project.mybatis.myMapper";
	
	public List<CommnuityDTO> listAll() {
		return sqlSession.selectList(namepasce+".selectAll_Commnuity");
	}

	public CommnuityDTO view(CommnuityDTO dto) {
		return sqlSession.selectOne(namepasce+".view_Commnuity",dto);
	}

	public void count(CommnuityDTO dto) {
		sqlSession.update(namepasce+".count_Commnuity",dto);
		
	}

	public void save_write(CommnuityDTO dto) {
		sqlSession.insert(namepasce+".insert_Commnuity",dto);
		
	}

	public void delete(CommnuityDTO dto) {
		sqlSession.delete(namepasce+".delete_Commnuity",dto);
	}

	public void update_save(CommnuityDTO dto) {
		
		sqlSession.update(namepasce+".update_Commnuity",dto);
	}
	
	public CommnuityDTO update(CommnuityDTO dto) {
		return sqlSession.selectOne(namepasce+".view_Commnuity",dto);
	}
	
	
}
	
	

