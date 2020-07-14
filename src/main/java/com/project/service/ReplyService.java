package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.ReplyDAO;
import com.project.dto.ReplyDTO;

@Service
public class ReplyService {
   @Autowired
   private ReplyDAO replydao;
   public List<ReplyDTO> select(int num) {
      return replydao.select(num);
   }
   public int insert(ReplyDTO dto) {
      return replydao.insert(dto);
   }
   public int delete(ReplyDTO dto) {
      return replydao.delete(dto);
   }
   public int update(ReplyDTO dto) {
      return replydao.update(dto);
   }
   public int last() {
      return replydao.last_reply();
   }
}