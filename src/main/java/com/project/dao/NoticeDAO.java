package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	public static final String namepasce="com.project.mybatis.myMapper";

	public List<AdminNoticeDTO> listAll(AdminNoticeDTO dto) {
		return sqlSession.selectList(namepasce+".selectAll_Notice",dto);
	}
	public AdminNoticeDTO view(AdminNoticeDTO dto) {
		return sqlSession.selectOne(namepasce+".view_Notice",dto);
	}

	public void count(AdminNoticeDTO dto) {
		sqlSession.update(namepasce+".count_Notice",dto);

	}
	public void save_write(AdminNoticeDTO dto) {
		sqlSession.insert(namepasce+".insert_Notice",dto);

	}
	public void delete(int num) {
		sqlSession.delete(namepasce+".delete_Notice",num);
	}

}
