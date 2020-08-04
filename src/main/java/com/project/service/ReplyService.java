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
	public int delete(int rno) {
		return replydao.delete(rno);
	}
	public int delete_Add(int rno,String brno) {
		ReplyDTO dto = new ReplyDTO();
		dto.setP_rno(rno);
		dto.setBrno(Integer.valueOf(brno));

		return replydao.delete(dto);
	}
	public int update(ReplyDTO dto) {
		return replydao.update(dto);
	}
	public int last() {
		return replydao.last_reply();
	}
	public String Writerchk(int rno) {
		return replydao.Writerchk(rno);
	}

	public int insertAddRe(ReplyDTO dto) {
		return replydao.insertAddRe(dto);
	}
	public int update_Add(ReplyDTO dto) {
		return replydao.update_Add(dto);
	}
}