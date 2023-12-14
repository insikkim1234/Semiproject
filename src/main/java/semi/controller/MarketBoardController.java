package semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import naver.storage.NcpObjectStorageService;
import semi.config.MarketBoardConfig;
import semi.dao.MarketBoardDao;
import semi.dao.MarketProductDao;
import semi.dto.BoardDto;
import semi.dto.BoardFileDto;
import semi.dto.MarketBoardDto;
import semi.dto.MarketProductDto;
import semi.dto.RecipeDto;
import semi.service.BoardFileService;
import semi.service.MarketBoardService;
import semi.service.MarketProductService;


@Controller
public class MarketBoardController {
	@Autowired
	private MarketBoardService marketBoardService;
	@Autowired
	private MarketProductService marketProductService;
	
	@Autowired NcpObjectStorageService storageService;
	@Autowired private MarketBoardDao marketBoardDao;
	@Autowired private MarketProductDao marketProductDao;
	@Autowired private MarketBoardConfig marketBoardConfig;
	
	
	 @GetMapping("/mboard")
	 public String boardList() {
		 return "market/marketboardlist";
	 }
	 
	 @GetMapping("/mboardform")
	 public String boardForm() {
		 return "market/marketboardform";
	 }
	
	 
	 @PostMapping("/mboard/insertMarketBoard")
	 public String insertMarketBoard(@ModelAttribute MarketBoardDto dto, @ModelAttribute MarketProductDto pdto,
	         HttpServletRequest request, HttpSession session, 
	         @RequestParam MultipartFile upload1, @RequestParam MultipartFile upload2, @RequestParam MultipartFile upload3) {
	     String photo = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
	             NcpObjectStorageService.DIR_PHOTO, upload1);
	     String photo2 = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
	             NcpObjectStorageService.DIR_PHOTO, upload2);
	     String photo3 = storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
	             NcpObjectStorageService.DIR_PHOTO, upload3);

	     dto.setSBoardImage(photo);

	     // 먼저 게시글 정보를 저장하고 게시글의 nBoardSeq를 가져옴
	     marketBoardService.insertMarketBoard(dto);
	     
	     pdto.setSProductImage1(photo2);
         pdto.setSProductImage2(photo3);
         
         pdto.setNBoardSeq(dto.getNBoardSeq());
         marketProductService.insertMarketProduct(pdto);
	    

	     return "redirect:/mboard";
	 }
	 
	 @GetMapping(value = {"", "/"})
		public String board(Model model,
							@RequestParam(required = false, defaultValue = "1") int pageNum) {

			if (pageNum < 1) pageNum = 1;

			List<MarketBoardDto> mdata = marketBoardService.getBoardWithPage(pageNum, marketBoardConfig.getPAGE_SIZE());

			model.addAttribute("pageNum", pageNum);
			model.addAttribute("mdata", mdata);

			return "board/boardlist";
		}



		

		
		
	
		
		
	 


		//새글일때/답글일때 모두 호출
		@GetMapping("/mboard/form")
		public String form(
				Model model,
				/*새글일경우 값이 안넘어오므로 defaultValue 값이 적용된다*/
				@RequestParam(defaultValue = "1") int currentPage,
				@RequestParam(defaultValue = "0") int num
				
				)
		{
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("num", num);

			return "market/marketboardform";
		}

		
		

			//새글인경우는 1페이지로, 답글인경우는 보던 페이지로 이동한다
//			return "redirect:list?currentPage="+currentPage;
//		}
//
//		@GetMapping("/mboard/content")
//		public String getContent(Model model,@RequestParam int nBoardSeq,@RequestParam(defaultValue = "1") int currentPage)
//		{
//			//조회수 증가
//			marketBoardService.updateReadCount(nBoardSeq);
//			//num 에 해당하는 dto 얻기
//			MarketBoardDto dto=marketBoardService.getData(nBoardSeq);
//			                                   
//			/*
//			//프로필 사진 가져오기
//			String profile_photo=memberDao.getData(dto.getMyid()).getPhoto();
//			*/
//			
//			/*
//			//사진과 사진 갯수
//			List<String> photos=marketProductService.getProductImageByNBoardSeq(nBoardSeq);
//			dto.setPhotocount(photos.size());//사진갯수
//			dto.setSBoardImage(photos);//사진 파일명들
//			*/
//	
//			//model 에 저장
//			//model.addAttribute("profile_photo", profile_photo);
//			model.addAttribute("dto", dto);
//			model.addAttribute("currentPage",currentPage);		
//	
//			return "market/content";
//		}
	
//		@GetMapping("/mboard/delete")
//		public String deleteBoard(@RequestParam int nBoardSeq,@RequestParam int currentPage)
//		{
//			//삭제
//			marketBoardService.deleteMarketBoard(nBoardSeq);
//	
//			return "redirect:./list?currentPage="+currentPage;
//		}
	
		/*
		 * @GetMapping("/board/updateform") public String updateForm(Model
		 * model,@RequestParam int nBoardSeq,@RequestParam int currentPage) {
		 * MarketBoardDto dto=marketBoardService.getData(nBoardSeq);
		 * List<MarketProductDto>
		 * flist=marketProductService.getFileDataByNBoardSeq(nBoardSeq);
		 * 
		 * model.addAttribute("currentPage", currentPage); model.addAttribute("dto",
		 * dto); model.addAttribute("flist", flist);
		 * 
		 * return "market/updateform"; }
		 */

}

