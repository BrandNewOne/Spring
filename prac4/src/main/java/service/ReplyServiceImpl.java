package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReplyDAO;
import dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyDAO replyDAO;
	
	@Override
	public List<Reply> boardReply(int bno) throws Exception{
		return replyDAO.boardReply(bno);
	}
	@Override
	public void writeReply(Reply reply) throws Exception{
		replyDAO.writeReply(reply);
	}
	@Override
	public int updateReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.updateReply(reply);
	}
	@Override
	public int deleteReply(Reply reply) throws Exception {
		// TODO Auto-generated method stub
		return replyDAO.deleteReply(reply);
	}

}
