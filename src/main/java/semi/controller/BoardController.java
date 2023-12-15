package semi.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import semi.config.BoardConfig;
import semi.dto.BoardDto;
import semi.dto.PageDto;
import semi.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;
	@Autowired private BoardConfig boardConfig;

	@GetMapping(value = "/list")
	public String board(Model model,
						@RequestParam(required = false, defaultValue = "1") int pageNum) {

		if (pageNum < 1) pageNum = 1;

		List<BoardDto> data = boardService.getBoardWithPage(pageNum, boardConfig.getPAGE_SIZE());
		int totalCnt = boardService.getTotalCount();

		PageDto pageDto = boardService.getPage(pageNum, totalCnt);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("data", data);
		model.addAttribute("totcalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);

		return "board/boardlist";
	}
}