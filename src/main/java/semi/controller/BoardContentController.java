package semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import semi.dto.BoardDto;
import semi.service.BoardService;


@Controller
@AllArgsConstructor
public class BoardContentController {
	@Autowired
	private BoardService boardService;

	//게시판 조회
	@GetMapping("/board/content")
	public String content(Model model,@RequestParam int comBoardSeq )
	{
		//num 에 해당하는 dto 얻기
		BoardDto dto=boardService.getData(comBoardSeq);
		//조회수 증가
		boardService.updateReadCount(dto.getComBoardSeq());

		//model 에 저장
		model.addAttribute("dto", dto);

		return "board/content";
	}
	
	//게시판 수정 페이지 이동
	@GetMapping("/board/updateform")
	public String updateForm(Model model,@RequestParam int comBoardSeq)
	{
		BoardDto dto = boardService.getData(comBoardSeq);
		
		model.addAttribute("dto",dto);
		return "board/updateform";
	}
	
	//게시판 수정
	@PostMapping("/board/updateprocess")
	public String update(@ModelAttribute BoardDto dto,
			@RequestParam int num )
	{
		dto.setComBoardSeq(num);
		boardService.updateBoard(dto);

		return "redirect:./content?comBoardSeq="+num;
	}
}