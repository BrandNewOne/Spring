package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.Reply;
import service.ReplyService;

@Controller
@RequestMapping("reply/*")
public class ReplyController {
	
	@Autowired
	ReplyService replyService;
	
	//댓글 작성
		@RequestMapping
		(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(Reply reply, RedirectAttributes rttr) throws Exception {
			
			System.out.println("replyWrite 들어옴");
			replyService.writeReply(reply);
			rttr.addAttribute("bno", reply.getBno());
			
			return "redirect:/board/readView";
		}
		
		//댓글 수정
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(Reply reply,RedirectAttributes rttr) throws Exception {
			
			replyService.updateReply(reply);
			
			rttr.addAttribute("bno", reply.getBno());
			
			return "redirect:/board/readView";
		}
		
		//댓글 삭제
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(Reply reply, RedirectAttributes rttr) throws Exception {

			replyService.deleteReply(reply);
			
			rttr.addAttribute("bno", reply.getBno());
			
			return "redirect:/board/readView";
		}

}
