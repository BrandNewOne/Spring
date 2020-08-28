package dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dto.Reply;



@Repository
public class ReplyDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	//댓글 조회
	public List<Reply> boardReply(int bno) throws Exception {	
		return sqlSession.selectList("boardReply", bno);

	}
	
	//댓글 작성
	public void writeReply(Reply reply) throws Exception {
		sqlSession.selectList("writeReply", reply);
	}
	
	//댓글 수정
	public int updateReply(Reply reply) throws Exception {	
		return sqlSession.update("updateReply", reply);

	}
	
	//댓글 삭제
	public int deleteReply(Reply reply) throws Exception {	
		return sqlSession.delete("deleteReply", reply);

	}
	
}
