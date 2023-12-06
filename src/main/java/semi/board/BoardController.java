package semi.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	 @GetMapping("/board")
	 public String boardList() {
		 return "board/boardlist";
	 }
	 
	 @GetMapping("/form")
	 public String boardForm() {
		 return "board/boardform";
	 }
	 
}
