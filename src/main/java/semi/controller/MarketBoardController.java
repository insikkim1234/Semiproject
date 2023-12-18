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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import naver.storage.NcpObjectStorageService;
import semi.config.MarketBoardConfig;
import semi.dao.MarketBoardDao;
import semi.dao.MarketProductDao;
import semi.dto.BoardDto;
import semi.dto.BoardFileDto;
import semi.dto.MarketBoardCommentDto;
import semi.dto.MarketBoardDto;
import semi.dto.MarketProductDto;
import semi.dto.RecipeDto;
import semi.service.BoardFileService;
import semi.service.MarketBoardCommentService;
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
	
	@Autowired
	private MarketBoardCommentService marketBoardCommentService;
	
	
	
	 
	 
	 
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

	     dto.setBoardImage(photo);

	     // 먼저 게시글 정보를 저장하고 게시글의 nBoardSeq를 가져옴
	     marketBoardService.insertMarketBoard(dto);
	     
	     pdto.setProductImage1(photo2);
         pdto.setProductImage2(photo3);
         
         pdto.setBoardSeq(dto.getBoardSeq());
         marketProductService.insertMarketProduct(pdto);
	    

	     return "redirect:/mboard";
	 }
	 
	 @GetMapping("/mboard")
		public String board(Model model,
							
							@RequestParam(defaultValue = "1") int currentPage) {
		 	int perPage=10;
		 	int totalCount=marketBoardService.getTotalCount();//총 게시글 갯수
		 	int totalPage;//총페이지수
		 	int startNum;//각페이지당 보여지는 글의 시작번호
		 	int perBlock=5;//한블럭당 보여지는 페이지의 개수
		 	int startPage;//각블럭당 보여지는 페이지의 시작번호
		 	int endPage;
		 
		 	
			
			//만약에 나머지가 있으면 다음페이지로 넘김
			totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
			
			//각 블럭의 시작페이지와 끝페이지 설정
			 startPage=(currentPage-1)/perBlock*perBlock+1;
			 endPage=startPage+perBlock-1;
			  
			  //엔드페이지가 총페이지보다 크면 (만약 게시글의 페이지가 13페이지까지 존재하는데 블락에 따라 15페이지까지 존재해야함)
			  if(endPage>totalPage)
				   endPage=totalPage;  
			  
			  //각 페이지당 시작하는 글의 번호
			  startNum=(currentPage-1)*perPage;
			  
			  //각 페이지의 시작 번호
			  int no=totalCount-(currentPage-1)*perPage;

			List<MarketBoardDto> mdata = marketBoardService.getList(startNum, perPage);
			
			
			
			
			
			model.addAttribute("mdata", mdata);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("totalPage",totalPage);
			  model.addAttribute("startPage",startPage);
			  model.addAttribute("endPage",endPage);
			  model.addAttribute("currentPage",currentPage);  
			  model.addAttribute("no",no);  

			return "market/marketboardlist";
		}
	 
	 @GetMapping("/mboard/content")
	 public String getContent(Model model,
			 @RequestParam int boardSeq,
			 @RequestParam(defaultValue = "1") int currentPage)
	 {
		 marketBoardService.updateReadCount(boardSeq);
		 
		 MarketBoardDto mdto=marketBoardService.getData(boardSeq);
		 MarketProductDto pdto=marketProductService.getData(boardSeq);
		 
		 model.addAttribute("mdto", mdto);
		 model.addAttribute("pdto", pdto);
		 model.addAttribute("currentPage", currentPage);
		 
		 
		 return "market/marketboardcontent";
	 }
	 
	 @PostMapping("/answer/insert")
	 public void insertAnswer(@RequestParam int boardSeq,
			 @RequestParam String msg,
			 HttpSession session)
	 {
		 MarketBoardCommentDto mcdto=new MarketBoardCommentDto();
		 mcdto.setBoardSeq(boardSeq);
		 mcdto.setCommentContent(msg);
		 
		 marketBoardCommentService.insertComment(mcdto);
		 
		 
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

