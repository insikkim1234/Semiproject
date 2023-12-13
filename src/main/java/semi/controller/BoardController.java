package semi.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import lombok.AllArgsConstructor;
import semi.dao.AnswerDao;
import semi.dao.BoardDao;
import semi.dto.AnswerDto;
import semi.dto.BoardDto;
@Controller
//@AllArgsConstructor
public class BoardController {
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private  AnswerDao answerDao;
	
	
	
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