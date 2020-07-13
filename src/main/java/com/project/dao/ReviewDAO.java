package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.ReviewDTO;

@Repository
public class ReviewDAO {
   @Autowired
   private SqlSession sqlSession;
   public static final String namepasce = "com.project.mybatis.myMapper";

   public List<ReviewDTO> selectAll(ReviewDTO dto) {
      return sqlSession.selectList(namepasce + ".selectAll_Review",dto);
   }
   public List<ReviewDTO> select(ReviewDTO dto) {
      return sqlSession.selectList(namepasce + ".select_Review",dto);
   }
   public int update(ReviewDTO dto) {
      return sqlSession.update(namepasce + ".update_Review",dto);
   }
   public int update_info(String rno) {
      return sqlSession.update(namepasce + ".update_Review_infocount",rno);
   }
   public int delect(String rno) {
      return sqlSession.delete(namepasce + ".delect_Review",rno);
   }
   public int delect_img(ReviewDTO dto) {
      return sqlSession.delete(namepasce + ".delect_Review_img",dto);
   }
   public int insert(ReviewDTO dto) {
      return sqlSession.insert(namepasce + ".insert_Review",dto);
   }
}