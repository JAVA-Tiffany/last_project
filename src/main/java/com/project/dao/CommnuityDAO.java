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
   
   
}
   
   
