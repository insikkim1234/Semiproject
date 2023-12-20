package semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import semi.dao.AnswerDao;
import semi.dao.BoardDao;
import semi.dto.AnswerDto;
import semi.dto.BoardDto;
import semi.service.BoardService;
@Controller
@AllArgsConstructor
public class BoardContentController {
	private BoardDao boardDao;
	private BoardService boardService;
	
	//게시판 조회
	@GetMapping("/board/content")
	public String content(Model model,@RequestParam int comBoardSeq )
	{
		//조회수 증가
		//num 에 해당하는 dto 얻기
		BoardDto dto=boardService.getData(comBoardSeq);
		System.out.println(dto+"sadsa확인");

		//model 에 저장


		model.addAttribute("dto", dto);
		

		return "board/content";
	}
	
	
	
}