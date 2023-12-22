package semi.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import annotation.Login;
import lombok.AllArgsConstructor;
import naver.storage.NcpObjectStorageService;
import semi.config.BoardConfig;
import semi.dao.MarketBoardDao;
import semi.dao.MarketProductDao;
import semi.dto.*;
import semi.service.MarketBoardService;
import semi.service.MarketProductService;
import utils.BoardUtils;
import semi.service.MarketBoardCommentService;

@Controller
@AllArgsConstructor
public class MarketBoardController {
	@Autowired
	private MarketBoardService marketBoardService;
	@Autowired
	private MarketProductService marketProductService;
	@Autowired
	NcpObjectStorageService storageService;
	@Autowired
	private MarketBoardCommentService marketBoardCommentService;
	
	private MarketBoardDao marketBoardDao;
	private MarketProductDao marketProductDao;

	@PostMapping("/mboard/insertMarketBoard")
	public String insertMarketBoard(@Login MemberDto user,@ModelAttribute MarketBoardDto dto, @ModelAttribute MarketProductDto pdto,
			HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload1,
			@RequestParam MultipartFile upload2, @RequestParam MultipartFile upload3) {
		String photo = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
				NcpObjectStorageService.DIR_PHOTO, upload1);
		String photo2 = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
				NcpObjectStorageService.DIR_PHOTO, upload2);
		String photo3 = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
				NcpObjectStorageService.DIR_PHOTO, upload3);

		dto.setBoardImage(photo);
		dto.setUserSeq(user.getUserSeq());
		// 먼저 게시글 정보를 저장하고 게시글의 nBoardSeq를 가져옴
		marketBoardService.insertMarketBoard(dto);

		pdto.setProductImage1(photo2);
		pdto.setProductImage2(photo3);

		pdto.setBoardSeq(dto.getBoardSeq());
		marketProductService.insertMarketProduct(pdto);

		return "redirect:/mboard";
	}

	@GetMapping("/mboard")
	public String board(Model model, @RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchWord) {
		int totalCount = marketBoardService.getTotalCount(searchWord);// 총 게시글 갯수

		PageDto pageDto = BoardUtils.getPage(currentPage, totalCount);
		List<MarketBoardDto> mdata = marketBoardService.getBoardWithPage(currentPage, BoardConfig.PAGE_SIZE,
				searchWord);

		model.addAttribute("mdata", mdata);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("isSearch", searchWord != null);

		return "market/marketboardlist";
	}

	@GetMapping("/mboard/content")
	public String getContent(Model model, @RequestParam int boardSeq,
			@RequestParam(defaultValue = "1") int currentPage) {
		marketBoardService.updateReadCount(boardSeq);

		MarketBoardDto mDto = marketBoardService.getData(boardSeq);
		MarketProductDto pDto = marketProductService.getData(boardSeq);
		
	
		
		
		model.addAttribute("mDto", mDto);
		model.addAttribute("pDto", pDto);
		model.addAttribute("currentPage", currentPage);

		return "market/marketboardcontent";
	}

	// 새글일때/답글일때 모두 호출
	@GetMapping("/mboard/form")
	public String form(Model model,
			/* 새글일경우 값이 안넘어오므로 defaultValue 값이 적용된다 */
			@RequestParam(defaultValue = "1") int currentPage, @RequestParam(defaultValue = "0") int num) {
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("num", num);

		return "market/marketboardform";
	}
	
	//삭제
	@GetMapping("/mboard/deletecontent")
	public String deleteMarketBoardContent(@Login MemberDto memberDto, @RequestParam int boardSeq,@RequestParam int currentPage)
	{
		//����
		System.out.println(boardSeq);
		MarketBoardDto dto=marketBoardService.getData(boardSeq);
		
		
		marketBoardService.deleteMarketBoardContent(boardSeq);
		
		return "redirect:/mboard";
	}
	@GetMapping("/mboard/updateform")
	public String updateForm(Model model,@RequestParam int boardSeq)
	{
		MarketBoardDto mDto=marketBoardDao.getData(boardSeq);
		MarketProductDto pDto=marketProductDao.getData(boardSeq);
		
		model.addAttribute("mDto",mDto);
		model.addAttribute("pDto", pDto);
		return "market/marketupdateform";
	}
	
	@PostMapping("/mboard/updatemarketboard")
	public String updateMarketBoard(@Login MemberDto user,@ModelAttribute MarketBoardDto dto, @ModelAttribute MarketProductDto pdto,
			HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload1,
			@RequestParam MultipartFile upload2, @RequestParam MultipartFile upload3,
			@RequestParam String boardTitle, @RequestParam int productPrice,
			@RequestParam String productPlace, @RequestParam String productContent ,
			@RequestParam int boardSeq
			) {
		String photo = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
				NcpObjectStorageService.DIR_PHOTO, upload1);
		String photo2 = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
				NcpObjectStorageService.DIR_PHOTO, upload2);
		String photo3 = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
				NcpObjectStorageService.DIR_PHOTO, upload3);

		dto.setBoardTitle(boardTitle);
		dto.setBoardSeq(boardSeq);
		dto.setBoardImage(photo);
		
		
		// 먼저 게시글 정보를 저장하고 게시글의 nBoardSeq를 가져옴
		marketBoardService.updateMarketBoard(dto);
		
		pdto.setProductPrice(productPrice);
		pdto.setProductPlace(productPlace);
		pdto.setProductContent(productContent);
		pdto.setProductImage1(photo2);
		pdto.setProductImage2(photo3);

		
		marketProductService.updateMarketProduct(pdto);

		return "redirect:/mboard";
	}
	


}
