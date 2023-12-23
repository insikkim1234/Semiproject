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
	private AnswerDao answerDao;
	
	//게시판 조회
	@GetMapping("/board/content")
	public String content(Model model,@RequestParam int comBoardSeq )
	{

		//num 에 해당하는 dto 얻기
		BoardDto dto=boardService.getData(comBoardSeq);
		System.out.println(dto+"sadsa확인");

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
		BoardDto dto=boardDao.getData(comBoardSeq);
		
		model.addAttribute("dto",dto);
		return "board/updateform";
	}
	
	//게시판 수정
	@PostMapping("/board/updateprocess")
	public String update(@ModelAttribute BoardDto dto,
			HttpServletRequest request, @RequestParam String content,
			@RequestParam String subject,
			@RequestParam int num )
	{
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		
		
		
		
		//db수정
		dto.setComBoardSeq(num);
		dto.setComBoardContent(content);
		dto.setComBoardSubject(subject);
		boardDao.updateBoard(dto);
		return "redirect:./content?comBoardSeq="+num;
	}
	
	
	
	//댓글 추가
		@PostMapping("/board/addanswer")
		public String addAnswer(@ModelAttribute AnswerDto dto,@RequestParam String nickname, @RequestParam String content,
				@RequestParam int num)
		{
			//댓글 추가
			
			dto.setComBoardCommentName(nickname);
			dto.setComBoardCommentMsg(content);
			dto.setComBoardCommentSeq(num);
			answerDao.insertAnswer(dto);
			
			
			return "redirect:./content?comBoardSeq="+dto.getComBoardCommentSeq();
		}
	

	
	
	@GetMapping("/board/delete")
	public String delete(@RequestParam int comBoardSeq)
	{
		boardDao.deleteBoard(comBoardSeq);
		return "redirect:./list";
	}
	
}