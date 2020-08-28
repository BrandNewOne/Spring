package service;

import java.util.List;
import dto.Reply;

public interface ReplyService {
	
	public List<Reply> boardReply(int bno) throws Exception;
	
	public void writeReply(Reply reply) throws Exception;
	
	public int updateReply(Reply reply) throws Exception;
	
	public int deleteReply(Reply reply) throws Exception;

}
