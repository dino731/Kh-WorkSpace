package com.kh.spring.board.medel.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.medel.vo.Attachment;
import com.kh.spring.board.medel.vo.Board;
import com.kh.spring.board.medel.vo.BoardExt;

public interface BoardService { 
	public List<Board> selectList(int currentPage,Map<String, Object> paramMap);
	
	public int selectListCount(Map<String, Object> paramMap);
	
	public int insertBaord(Board b, List<Attachment>list, String serverFolderPath, String webPath)throws Exception;
	
	public BoardExt selectBoard(int boardNo);
	
	public int increaseCount(int bno);
	
	public List<Reply>

	public Attachment selectAttachment(int fileNo);
	
	public int updateBoard(Board b, List<MultipartFile>list, String severFolderPath,String webPath);\
	
	public List<String> selectFileList();
}