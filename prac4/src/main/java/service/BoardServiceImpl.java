package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BoardDAO;
import dto.Boards;
import dto.Criteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;
	
	// 게시글 작성
	@Override
	public int boardWrite(Boards boards) throws Exception {
		return boardDAO.boardWrite(boards);
	}
	
	//게시글 조회
	@Override
	public List<Boards> boardList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.boardList(cri);
	}
	
//	//게시글 조회
//	@Override
//	public List<Boards> boardList() throws Exception {
//		// TODO Auto-generated method stub
//		return boardDAO.boardList();
//	}
//	
	//게시글 개수
	@Override
	public int listCount() throws Exception {
		return boardDAO.listCount();
	}
	
	// 게시글 보기
	@Override
	public Boards boardRead(int bno) throws Exception {
		return boardDAO.boardRead(bno);
	}
	
	@Override
	public void boardUpdate(Boards boards) throws Exception {

		boardDAO.boardUpdate(boards);
	}

	@Override
	public void boardDelete(int bno) throws Exception {
		
		boardDAO.boardDelete(bno);
	}
	

}
