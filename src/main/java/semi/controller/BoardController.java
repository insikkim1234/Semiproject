package semi.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import semi.dao.BoardDao;
import semi.dto.BoardDto;
import semi.dto.BoardFileDto;
import semi.service.BoardFileService;


@Controller
//@AllArgsConstructor
public class BoardController {
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardFileService boardFileService;

	@GetMapping(value = "/board")
	public String board(Model model) {
		return "/board/boardlist";
	}
	
	@GetMapping("/board/list")
	public String list(Model model)
	{
		//전체 갯수 가져오기
		int totalCount=boardDao.getTotalCount();
		//전체 데이타 가져오기
		List<BoardDto> list=boardDao.getAllDatas();
		
		
		//model 에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		return "board/boardlist";
	}
	
}