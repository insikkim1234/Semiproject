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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.mysql.cj.result.Field;
import semi.dto.BoardDto;
import semi.dto.BoardFileDto;
import semi.service.BoardFileService;
import semi.service.BoardService;
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardFileService boardFileService;
	
	@GetMapping("/board/list")
	public String list(Model model,@RequestParam(defaultValue = "1") int currentPage)
	{
		//페이징처리
		//페이징에 처리에 필요한 변수들
		int perPage=5; //한페이지당 보여지는 게시글의 갯수
		int totalCount=0; //총 개시글의 개수
		int totalPage;//총페이지수
		int startNum;//각페이지당 보여지는 글의 시작번호
		int perBlock=5; //한블럭당 보여지는 페이지의 개수
		int startPage; //각블럭당 보여지는 페이지의 시작번호
		int endPage;
		//총 글갯수
		totalCount=boardService.getTotalCount();
		//총페이지수,나머지가 있으면 무조건올림
		//총게시글이 37-한페이지 3-12.3333....13페이지
		totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
		//각블럭의 시작페이지와 끝페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		//endPage는 totalPage를 넘지않도록 한다
		if(endPage>totalPage)
			endPage=totalPage;
		//각페이지당 불러올 글의 번호
		//10개씩일경우 기준
		//1페이지:0~9 2페이지:10~19
		startNum=(currentPage-1)*perPage;
		//각 페이지의 시작 번호
		int no=totalCount-(currentPage-1)*perPage;
		//해당페이지에 보여줄 게시판 목록
		List<BoardDto> list=boardService.getList(startNum, perPage);
		
		//request 에 담을 값들
		model.addAttribute("list",list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("no",no);
		return "board/boardlist";
	}
	// 새로운 메서드 추가
	@GetMapping("/board/form")
	public String semiForm(Model model,
	        @RequestParam(defaultValue = "1") int currentPage,
	        @RequestParam(defaultValue = "0") int nComBoardSeq,
	        @RequestParam(defaultValue = "0") int nComBoardRegroup,
	        @RequestParam(defaultValue = "0") int nComBoardRestep,
	        @RequestParam(defaultValue = "0") int nComBoardRelevel) {
	    model.addAttribute("currentPage", currentPage);
	    model.addAttribute("nComBoardSeq", nComBoardSeq);
	    model.addAttribute("nComBoardRegroup", nComBoardRegroup);
	    model.addAttribute("nComBoardRestep", nComBoardRestep);
	    model.addAttribute("nComBoardRelevel", nComBoardRelevel);
	    
	

	   

	    return "board/boardform";
	}

	//새글/답글 저장
	@PostMapping("/board/addboard")
	public String addBoard(
			@ModelAttribute BoardDto dto,
			@RequestParam int currentPage,
			@RequestParam List<MultipartFile> upload,
			HttpServletRequest request,
			HttpSession session
			)
	{
		//파일 업로드할 경로
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		//db 에 저장할 로그인정보
		String myid=(String)session.getAttribute("sUserEmail");
		String sUserName=(String)session.getAttribute("sUserName");
		//dto 에 넣기
		
		dto.setSUserName(sUserName);
		//일단 BoardDto 먼저 저장
		boardService.insertBoard(dto);
		//selectKey : num 값 넘어왔는지 확인
		System.out.println("num="+dto.getNComBoardSeq());
		//사진들 업로드
		//사진 업로드를 안했을경우 리스트의 첫데이타의 파일명이 빈문자열이 된다
		//즉 업로드했을경우에만 db 에 저장을 한다
		if(!upload.get(0).getOriginalFilename().equals("")) {
			for(MultipartFile multi:upload)
			{
				//랜덤 파일명 생성
				String fileName=UUID.randomUUID().toString();
				//업로드
				try {
					multi.transferTo(new File(path+"/"+fileName));
					//파일은 따로 db 에 insert 한다
					BoardFileDto fdto=new BoardFileDto();
					fdto.setNum(dto.getNComBoardSeq());//boarddb 에 방금 insert 된 num값
					fdto.setPhotoname(fileName);
					boardFileService.insertPhoto(fdto);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		//새글인경우는 1페이지로, 답글인경우는 보던 페이지로 이동한다
		return "redirect:list?currentPage="+currentPage;
	}
	@GetMapping("/board/content")
	public String getContent(Model model,@RequestParam int num,@RequestParam(defaultValue = "1") int currentPage)
	{
		//조회수 증가
		boardService.updateReadCount(num);
		//num 에 해당하는 dto 얻기
		BoardDto dto=boardService.getData(num);
		
		
		//model 에 저장
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage",currentPage);		
		return "board/content";
	}
	@GetMapping("/board/delete")
	public String deleteBoard(@RequestParam int num,@RequestParam int currentPage)
	{
		//삭제
		boardService.deleteBoard(num);
		return "redirect:./list?currentPage="+currentPage;
	}
	@GetMapping("/board/updateform")
	public String updateForm(Model model,@RequestParam int num,@RequestParam int currentPage)
	{
		BoardDto dto=boardService.getData(num);
		List<BoardFileDto> flist=boardFileService.getFileDataByNum(num);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("dto", dto);
		model.addAttribute("flist", flist);		
		return "board/updateform";
	}
	@GetMapping("/board/delphoto")
	@ResponseBody public void deletePhoto(@RequestParam int idx)
	{
		//해당 사진 삭제
		boardFileService.deletePhoto(idx);
	}
	//게시판 수정
	@PostMapping("/board/updateboard")
	public String updateBoard(
			@ModelAttribute BoardDto dto,
			@RequestParam int currentPage,
			@RequestParam List<MultipartFile> upload,
			HttpServletRequest request,
			HttpSession session
			)
	{
		//파일 업로드할 경로
		String path=request.getSession().getServletContext().getRealPath("/resources/upload");
		
		//수정
		boardService.updateBoard(dto);
		
		//사진들 업로드
		//사진 업로드를 안했을경우 리스트의 첫데이타의 파일명이 빈문자열이 된다
		//즉 업로드했을경우에만 db 에 저장을 한다
		if(!upload.get(0).getOriginalFilename().equals("")) {
			for(MultipartFile multi:upload)
			{
				//랜덤 파일명 생성
				String fileName=UUID.randomUUID().toString();
				//업로드
				try {
					multi.transferTo(new File(path+"/"+fileName));
					//파일은 따로 db 에 insert 한다
					BoardFileDto fdto=new BoardFileDto();
					fdto.setNum(dto.getNComBoardSeq());
					fdto.setPhotoname(fileName);
					boardFileService.insertPhoto(fdto);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		//수정후 내용보기로 이동한다
		return "redirect:./content?currentPage="+currentPage+"&num="+dto.getNComBoardSeq();
	}
}