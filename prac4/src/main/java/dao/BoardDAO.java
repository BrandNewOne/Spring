package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Boards;
import dto.Criteria;

@Repository
public class BoardDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	//게시글 작성
	public int boardWrite(Boards boards) throws Exception {
		return sqlSession.insert("boardWrite", boards);
	
	}
	
	//게시글 조회
	public List<Boards> boardList(Criteria cri) throws Exception {	
		return sqlSession.selectList("boardList", cri);

	}
	
//	//게시글 조회
//	public List<Boards> boardList() throws Exception {	
//		return sqlSession.selectList("boardList");
//
//	}
	
	//게시글 개수
	public int listCount() throws Exception {
		return sqlSession.selectOne("listCount");
	}
	
	// 게시물 보기
	public Boards boardRead(int bno) throws Exception {
			
		return sqlSession.selectOne("boardRead", bno);
	}
	
	// 게시물 수정
	public void boardUpdate(Boards boards) throws Exception {
		
		sqlSession.update("boardUpdate", boards);
	}

	// 게시물 삭제
	public void boardDelete(int bno) throws Exception {
		
		sqlSession.delete("boardDelete", bno);
	}
	
	
}
