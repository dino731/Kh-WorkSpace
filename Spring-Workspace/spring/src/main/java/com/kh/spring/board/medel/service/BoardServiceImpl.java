package com.kh.spring.board.medel.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.medel.dao.BoardDao;
import com.kh.spring.board.medel.vo.Attachment;
import com.kh.spring.board.medel.vo.Board;
import com.kh.spring.board.medel.vo.BoardExt;
import com.kh.spring.common.Utils;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	public List<Board> selectList(int currentPage, Map<String, Object> paramMap){
		return boardDao.selectList(currentPage, paramMap);
	}
	
	public int selectListCount(Map<String, Object> paramMap) {
		return boardDao.selectListCount(paramMap);
	}
	
	/*
	 * 게시글 + 첨부파일이 함께 삽입 => 이중 하나라도 에러가 발생할 경우 전체 rollback 해줘야한다.
	 * 
	 * @Transactional 선언적 트랜잭션 처리 방법
	 * rollbackFor => rollback 터리를 수행하기 위한 에러의 종류.
	 * 즉, rollbackFor의 속성 값으로 추가된 예외가 발생할 경우 rollback 처리를 시켜준다.
	 * 
	 * */
	@Transactional(rollbackFor = {Exception.class})// 어떤 종류의 예외가 발생했든 발생했다면 무조건 rollback 시키겠다.
	@Override
	public int insertBaord(Board b, List<Attachment>list, String serverFolderPath, String webPath)throws Exception {
		// 1. 게시글 삽입
		//    게시글 등록 후 해당 게시글의 pk값을 반환받기
		//	  게시글 삽입 시 게시글의 제목과 본문에 들어가는 문자열에 크로스 사이트 스트립트 공격을 방지하기 위한 메소드 추가
		//	  텍스트에리어태그에 엔터, 스페이스바를 개행문자로 변환 처리
		b.setBoardTitle(Utils.XSSHandling(b.getBoardTitle()));
		b.setBoardContent(Utils.XSSHandling(b.getBoardContent()));
		b.setBoardContent(Utils.newLineHandling(b.getBoardContent()));
		
		int boardNo = boardDao.insertBoard(b); // 반환값은 처리된 행의 개수가 아닌 pk값을 반환받음
												// 제대로 삽입이 안될 경우 0을 반환할 예정이다.
		
		
		// 2. 첨부파일 등록 -> list가 비어있지 않은 경우 실행 (버전 1)
		/*
		 * int result = 1; if(boardNo > 0 && !list.isEmpty()) { for(Attachment attach :
		 * list) { attach.setRefBno(boardNo); attach.setFilePath(webPath); result *=
		 * insertAttachment(attach); } }
		 */
		int result = 0;
		if(boardNo > 0 && !list.isEmpty()) {
			for(Attachment attach : list) {
				attach.setRefBno(boardNo);
				attach.setFilePath(webPath);
			}
			result = boardDao.insertAttachment(list);
			if(result != list.size()) { //이미지 삽입 실패시 강제 예외 발생
				throw new Exception("예외발생");
			}
		}
		return result;
	}
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateBoard(Board b, List<MultipartFile>list, String severFolderPath,String webPath) throws Exception {
		
		// 1. XSS, 개행문자 처리
		b.setBoardTitle(Utils.XSSHandling(b.getBoardTitle()));
		b.setBoardContent(Utils.XSSHandling(b.getBoardContent()));
		b.setBoardContent(Utils.newLineHandling(b.getBoardContent()));
		
		// 2. 게시글 업데이트 수정
		int result = boardDao.updateBoard(b);
		
		if(result >0) {
			// 3. 업로드된 파일들 분류 작업.
			List<Attachment> attachList = new ArrayList();
			if(list != null) {
				for(int i = 0; i<list.size(); i++) {
					if(!list.get(i).isEmpty()) {
						// 변경된 파일명 저장
						String changeName = Utils.saveFile(list.get(i), severFolderPath);
						
						// Attachment 객체를 생성해서 값을 추가한 후 attachList에 추가
						Attachment at = Attachment
										.builder()
										.refBno(b.getBoardNo())
										.fileLevel(i)
										.originName(list.get(i).getOriginalFilename())
										.changeName(changeName)
										.build();
						attachList.add(at);
					}
				}
			}
			// 4. x버튼을 눌렀을 때 이미지를 db에서 삭제
			if(deleteList) {
				Map<String, Object> =
				map.put("deleteList", deleteList);
			
				result = boardDao.deleteAttachment(map);
			}
			
			// 5. db에서 삭제에 성공했다면
			if(result >0) {
				for(Attachment at : attachList) {
					result = boardDao.updateAttachment(at); 
				}
				if(result == 0) {
					result = boardDao.insertAttachment(at);
				}
			}
			
			
				// Attachment 객체 하나하나 업데이트
				// 6. 
		}
		return result;
		
	}
	
	public int insertAttachment(Attachment attach) {
		return boardDao.insertAttachment(attach);
	}
	
	public BoardExt selectBoard(int boardNo) {
		return boardDao.selectBoard(boardNo);
	}
	
	public int increaseCount(int bno) {
		return boardDao.increaseCount(bno);
	}
	
	public Attachment selectAttachment(int fileNo) {
		return boardDao.selectAttachment(fileNo);
	}
	
	public List<String> selectFileList(){
		return boardDao.selectFileList();
	}
	
	
	
}