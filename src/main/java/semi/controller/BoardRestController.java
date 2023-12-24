package semi.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import semi.dto.AnswerDto;
import semi.service.BoardAnswerService;

@RestController
public class BoardRestController {
	@Autowired BoardAnswerService boardAnswerService;

	@PostMapping("/board/answerList")
	HashMap<String, Object> answerList(@ModelAttribute AnswerDto answerDto)
	{
		HashMap<String, Object> resultMap= new HashMap<String, Object>();

		boardAnswerService.insertAnswer(answerDto);

		List<AnswerDto> AnswerDtoList= boardAnswerService.getAnswers(answerDto.getComBoardCommentSeq());
		resultMap.put("data", AnswerDtoList);

		return resultMap;
	}

	@GetMapping("/board/getAnswerList")
	HashMap<String, Object> getAnswerList(@RequestParam int boardSeq)
	{
		HashMap<String, Object> resultMap= new HashMap<String, Object>();

		List<AnswerDto> AnswerDtoList= boardAnswerService.getAnswers(boardSeq);
		resultMap.put("data", AnswerDtoList);

		return resultMap;
	}
}
