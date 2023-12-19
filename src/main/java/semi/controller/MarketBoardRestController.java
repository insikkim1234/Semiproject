package semi.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import annotation.Login;
import semi.dto.MarketBoardCommentDto;
import semi.dto.MemberDto;
import semi.service.MarketBoardCommentService;

@RestController
public class MarketBoardRestController {
	@Autowired MarketBoardCommentService marketBoardCommentService;

	@PostMapping("/mboard/insertAnswer")
	public Map<String, Object> insertAnswer(@Login MemberDto memberDto, @RequestParam int boardSeq, @RequestParam String msg) {
		Map<String, Object> map = new HashMap<>();
		
		MarketBoardCommentDto mbcDto = new MarketBoardCommentDto();
		mbcDto.setBoardSeq(boardSeq);
		mbcDto.setCommentContent(msg);
		mbcDto.setUserSeq(memberDto.getUserSeq());
		
		
		int res = marketBoardCommentService.insertComment(mbcDto);
		
		if (res == 1) {
			map.put("status", "200");
			map.put("msg", "OK");	
		}
		else {
			map.put("status", "500");
			map.put("msg", "FAIL");
		}
		
		return map;
	}
}
