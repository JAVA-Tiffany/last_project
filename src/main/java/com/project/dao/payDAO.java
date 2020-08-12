package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.PayDTO;

@Repository
public class payDAO {
   @Autowired private SqlSession sqlSession;
   public static final String namepasce="com.project.mybatis.myMapper";
   public List<PayDTO> selectAll() {
      return sqlSession.selectList(namepasce+".selectAll_Userimg");
   }
   public List<PayDTO> select(String name) {
      return sqlSession.selectList(namepasce+".select_Userimg",name);
   }
   public int insert(PayDTO dto) {
      return sqlSession.insert(namepasce+".insert_Userimg",dto);
   }
   public int delete(PayDTO dto) {
      return sqlSession.delete(namepasce+".delete_Userimg", dto);
   }
   public int update(PayDTO dto) {
      return sqlSession.update(namepasce+".update_Userimg", dto);
   }
   public int update_Count(PayDTO dto) {
      return sqlSession.update(namepasce+".update_Count", dto);
   }
   public int update_Countd(PayDTO dto) {
      return sqlSession.update(namepasce+".update_Count-1", dto);
   }
   public List<PayDTO> order_list(PayDTO dto){
      return sqlSession.selectList(namepasce+".select_orderList",dto);
   }
   public int update_review_ch(PayDTO dto) {
      System.out.println(dto.getReview_ch());
      return sqlSession.update(namepasce+".update_review_ch",dto);
   }
   
   public List<PayDTO> cartSearch_id(PayDTO dto) {
	      return sqlSession.selectList(namepasce + ".cartSearch_id", dto);
	   }
	   public List<PayDTO> cartSearch_order_id(PayDTO dto) {
	      return sqlSession.selectList(namepasce + ".cartSearch_order_id", dto);
	   }
	   public String cartSearch_id_count(PayDTO dto) {
	      return sqlSession.selectOne(namepasce + ".cartSearch_id_count",dto);
	   }
	   public String cartSearch_order_id_count(PayDTO dto) {
	      return sqlSession.selectOne(namepasce + ".cartSearch_order_id_count",dto);
	   }
	   
	   public Object selectAll_size() {
		      return sqlSession.selectOne(namepasce+".selectAll_Userimg_count");
		   }
		   public Object selectAll_number(PayDTO dto) {
		      return sqlSession.selectList(namepasce+".selectAll_Userimg_number",dto);
		   }
	   
	   
}