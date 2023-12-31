package semi.controller;
import java.util.List;

import annotation.Login;
import naver.storage.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import semi.config.BoardConfig;
import semi.dto.BoardDto;
import semi.dto.MemberDto;
import semi.dto.PageDto;
import semi.service.BoardService;
import utils.BoardUtils;


@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;
	@Autowired private NcpObjectStorageService storageService;

	@GetMapping(value = "/list")
	public String boardList(Model model,
						@RequestParam(required = false, defaultValue = "1") int pageNum,
						@RequestParam(required = false) String searchWord) {

		if (pageNum < 1) pageNum = 1;

		List<BoardDto> data = boardService.getBoardWithPage(pageNum, BoardConfig.PAGE_SIZE, searchWord);
		int totalCnt = boardService.getTotalCount(searchWord);

		PageDto pageDto = BoardUtils.getPage(pageNum, totalCnt);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("data", data);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("isSearch", searchWord != null);

		return "board/boardlist";
	}

	@GetMapping(value = "/form")
	public String boardForm(@Login MemberDto user) {
		return "board/boardform";
	}

	@PostMapping("/insertBoard")
	public String insertBoard(@Login MemberDto user, BoardDto boardDto, MultipartFile upload) {
		String photo = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
				NcpObjectStorageService.DIR_PHOTO, upload);

		boardDto.setComBoardPhoto(photo);

		boardDto.setComBoardUserSeq(user.getUserSeq());
		boardService.insertBoard(boardDto);

		return "redirect:./list";
	}

}