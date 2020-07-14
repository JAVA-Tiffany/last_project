package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.ReplyDTO;

@Repository
public class ReplyDAO {
   @Autowired private SqlSession sqlSession;
   public static final String namepasce="com.project.mybatis.myMapper";
   public List<ReplyDTO> select(int num) {
      return sqlSession.selectList(namepasce+".select_reply",num);
   }
   public int insert(ReplyDTO dto) {
      return sqlSession.insert(namepasce+".insert_reply",dto);
   }
   public int delete(ReplyDTO dto) {
      return sqlSession.delete(namepasce+".delete_reply", dto);
   }
   public int update(ReplyDTO dto) {
      return sqlSession.update(namepasce+".update_reply", dto);
   }
   public int last_reply() {
      return sqlSession.selectOne(namepasce+".max_rno");
   }
}