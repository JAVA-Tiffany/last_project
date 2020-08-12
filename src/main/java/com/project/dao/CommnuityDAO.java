package com.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.AdminNoticeDTO;
import com.project.dto.CommnuityDTO;
import com.project.dto.ReplyDTO;

@Repository
public class CommnuityDAO {
   @Autowired
   private SqlSession sqlSession;
   
   public static final String namepasce="com.project.mybatis.myMapper";
   
   public List<CommnuityDTO> listAll(CommnuityDTO dto) {
      
      return sqlSession.selectList(namepasce+".selectAll_Commnuity",dto);
   }
   
   public List<CommnuityDTO> adminlist(CommnuityDTO dto) {
      return sqlSession.selectList(namepasce+".selectAdminAll_Commnuity",dto);
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
     List<ReplyDTO> arr =sqlSession.selectList(namepasce+".select_reply",dto.getBno());
     for(int i=0;i<arr.size();i++) {
        ReplyDTO reply = new ReplyDTO();
        reply.setBno(arr.get(i).getBno());
        reply.setRno(arr.get(i).getRno());
        sqlSession.delete(namepasce+".delete_reply", reply);
     }
      sqlSession.delete(namepasce+".delete_Commnuity",dto);
   }

   public void update_save(CommnuityDTO dto) {
      
      sqlSession.update(namepasce+".update_Commnuity",dto);
   }
   
   public CommnuityDTO update(CommnuityDTO dto) {
      return sqlSession.selectOne(namepasce+".view_Commnuity",dto);
   }
   
   
   
   public List<CommnuityDTO> listSearch_title(CommnuityDTO dto) {
	      return sqlSession.selectList(namepasce + ".listSearch_title", dto);
	   }

	   public List<CommnuityDTO> listSearch_Content(CommnuityDTO dto) {
	      return sqlSession.selectList(namepasce + ".listSearch_Content", dto);
	   }

	   public List<CommnuityDTO> listSearch(CommnuityDTO dto) {
	      return sqlSession.selectList(namepasce + ".listSearch", dto);
	   }
	public String listSearch_title_count(CommnuityDTO dto) {
	      return sqlSession.selectOne(namepasce + ".listSearch_title_count",dto);
	   }
	   public String listSearch_Content_count(CommnuityDTO dto) {
	      return sqlSession.selectOne(namepasce + ".listSearch_Content_count",dto);
	   }
	   public String listSearch_count(CommnuityDTO dto) {
	      System.out.println("qqq : "+dto.getWriter());
	      return sqlSession.selectOne(namepasce + ".listSearch_count",dto);
	   }
	   
	   
	   
	   public List<AdminNoticeDTO> noticeSearch_title(CommnuityDTO dto) {
	      return sqlSession.selectList(namepasce + ".noticeSearch_title", dto);
	   }

	   public List<AdminNoticeDTO> noticeSearch_Content(CommnuityDTO dto) {
	      return sqlSession.selectList(namepasce + ".noticeSearch_Content", dto);
	   }
	   public String noticeSearch_title_count(CommnuityDTO dto) {
	      return sqlSession.selectOne(namepasce + ".noticeSearch_title_count",dto);
	   }
	   public String noticeSearch_Content_count(CommnuityDTO dto) {
	      return sqlSession.selectOne(namepasce + ".noticeSearch_Content_count",dto);
	   }
	   
	   public String board_select_count() {
		      return sqlSession.selectOne(namepasce + ".board_select_count");
		}
	   
}
   
   