package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.PayDTO;

@Repository
public class googleChartDAO {
   
   @Autowired private SqlSession sqlSession;
   public static final String namepasce="com.project.mybatis.myMapper";
   public List<PayDTO> Chart(PayDTO dto) {
      return sqlSession.selectList(namepasce+".selectChart",dto);
   }

}