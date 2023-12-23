package semi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import annotation.Login;
import semi.dao.AnswerDao;
import semi.dto.AnswerDto;
import semi.dto.MemberDto;
import semi.service.BoardAnswerService;

@RestController
public class BoardRestController {
@Autowired BoardAnswerService boardAnswerService;
@Autowired AnswerDao answerDao;


@PostMapping("/board/answerList")
 HashMap<String, Object> answerList(@ModelAttribute AnswerDto answerDto)
{
	HashMap<String, Object> resultMap= new HashMap<String, Object>();
	
	answerDao.insertAnswer(answerDto);
	
	List<AnswerDto> AnswerDtoList= answerDao.getAnswers(answerDto.getComBoardCommentSeq());
	System.out.println(answerDto.getComBoardCommentSeq());
	System.out.println(AnswerDtoList.toString());
	System.out.println("11111111111111111111111");
	
	
	resultMap.put("data", answerDao.getAnswers(answerDto.getComBoardCommentSeq()));
	return resultMap;
}


	
	
	
}
