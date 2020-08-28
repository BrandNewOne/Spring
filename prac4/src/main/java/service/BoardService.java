package service;

import java.util.List;

import dto.Boards;
import dto.Criteria;


public interface BoardService{
	
	// 게시글 작성
	public int boardWrite(Boards boards) throws Exception;
	
//	//게시글 조회
	public List<Boards> boardList(Criteria cri) throws Exception;
//	public List<Boards> boardList() throws Exception;
	
	//게시물 개수
	public int listCount() throws Exception;
	
	//게시글 보기
	public Boards boardRead(int bno) throws Exception;
	
	// 게시물 수정
	public void boardUpdate(Boards boards) throws Exception;
	
	// 게시물 삭제
	public void boardDelete(int bno) throws Exception;

}
