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

import semi.dto.MarketBoardDto;
import semi.service.MarketBoardService;

@Controller
public class MarketBoardController {

	 @GetMapping("/mboard")
	 public String boardList() {
		 return "market/marketboardlist";
	 }
	 
	 @GetMapping("/mboardform")
	 public String boardForm() {
		 return "market/marketboardform";
	 }
	 
	 @Autowired
		private MarketBoardService marketBoardService;

		/*
		@Autowired private MarketBoardProductService boardFileService;
	
		
		
		@Autowired private MArketBoardCommetnService answerService;
		

		@Autowired
		private MemberDao memberDao;
		 */
	 
		@GetMapping("/mboard/list")
		public String list(Model model,@RequestParam(defaultValue = "1") int currentPage)
		{
			////
			//����¡ó��
			//����¡�� ó���� �ʿ��� ������
			int perPage=5; //���������� �������� �Խñ��� ����
			int totalCount=0; //�� ���ñ��� ����
			int totalPage;//����������
			int startNum;//���������� �������� ���� ���۹�ȣ
			int perBlock=5; //�Ѻ��� �������� �������� ����
			int startPage; //������ �������� �������� ���۹�ȣ
			int endPage;

			//�� �۰���
			totalCount=marketBoardService.getTotalCount();


			//����������,�������� ������ �����ǿø�
			//�ѰԽñ��� 37-�������� 3-12.3333....13������
			totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);

			//������ ������������ ��������
			startPage=(currentPage-1)/perBlock*perBlock+1;
			endPage=startPage+perBlock-1;

			//endPage�� totalPage�� �����ʵ��� �Ѵ�
			if(endPage>totalPage)
				endPage=totalPage;

			//���������� �ҷ��� ���� ��ȣ
			//10�����ϰ�� ����
			//1������:0~9 2������:10~19 
			startNum=(currentPage-1)*perPage;

			//�� �������� ���� ��ȣ
			int no=totalCount-(currentPage-1)*perPage;

			//�ش��������� ������ �Խ��� ���
			List<MarketBoardDto> list=marketBoardService.getList(startNum, perPage);
			//�� dto �� ÷�ε� ������ ���� ����
			/*
			for(MarketBoardDto dto:list)
			{
				int pcount=boardFileService.getPhotoByNum(dto.getNum()).size();
				//System.out.println(dto.getNum()+":"+ pcount);
				dto.setPhotocount(pcount);
				
				//��� ���� ����
				int acount=answerService.getAnswerBoard(dto.getNum()).size();
				dto.setAcount(acount);
			}
			*/
			//request �� ���� ����
			model.addAttribute("list",list);
			model.addAttribute("totalCount",totalCount);
			model.addAttribute("totalPage",totalPage);
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage",endPage);
			model.addAttribute("currentPage",currentPage);  
			model.addAttribute("no",no);  

			return "market/marketboardlist";
		}

		//�����϶�
		@GetMapping("/mboard/form")
		public String form(
				Model model,
				/*�����ϰ�� ���� �ȳѾ���Ƿ� defaultValue ���� ����ȴ�*/
				@RequestParam(defaultValue = "1") int currentPage,
				@RequestParam(defaultValue = "0") int num
				
				)
		{
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("num", num);

			return "market/marketboardform";
		}

		/*
		//����/��� ����
		@PostMapping("/board/addboard")
		public String addBoard(
				@ModelAttribute BoardDto dto,
				@RequestParam int currentPage,
				@RequestParam List<MultipartFile> upload,
				HttpServletRequest request,
				HttpSession session
				)
		{
			//���� ���ε��� ���
			String path=request.getSession().getServletContext().getRealPath("/resources/upload");
			//db �� ������ �α�������
			String myid=(String)session.getAttribute("myid");
			String writer=(String)session.getAttribute("myname");
			//dto �� �ֱ�
			dto.setMyid(myid);
			dto.setWriter(writer);

			//�ϴ� BoardDto ���� ����
			boardService.insertBoard(dto);
			//selectKey : num �� �Ѿ�Դ��� Ȯ��
			System.out.println("num="+dto.getNum());

			//������ ���ε�
			//���� ���ε带 ��������� ����Ʈ�� ù����Ÿ�� ���ϸ��� ���ڿ��� �ȴ�
			//�� ���ε�������쿡�� db �� ������ �Ѵ�
			if(!upload.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile multi:upload)
				{
					//���� ���ϸ� ����
					String fileName=UUID.randomUUID().toString();
					//���ε�
					try {
						multi.transferTo(new File(path+"/"+fileName));
						//������ ���� db �� insert �Ѵ�
						BoardFileDto fdto=new BoardFileDto();
						fdto.setNum(dto.getNum());//boarddb �� ��� insert �� num��
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

			//�����ΰ��� 1��������, ����ΰ��� ���� �������� �̵��Ѵ�
			return "redirect:list?currentPage="+currentPage;
		}

		@GetMapping("/board/content")
		public String getContent(Model model,@RequestParam int num,@RequestParam(defaultValue = "1") int currentPage)
		{
			//��ȸ�� ����
			boardService.updateReadCount(num);
			//num �� �ش��ϴ� dto ���
			BoardDto dto=boardService.getData(num);
			//������ ���� ��������
			String profile_photo=memberDao.getData(dto.getMyid()).getPhoto();
			//������ ���� ����
			List<String> photos=boardFileService.getPhotoByNum(num);
			dto.setPhotocount(photos.size());//��������
			dto.setPhotoNames(photos);//���� ���ϸ��

			//model �� ����
			model.addAttribute("profile_photo", profile_photo);
			model.addAttribute("dto", dto);
			model.addAttribute("currentPage",currentPage);		

			return "board/content";
		}

		@GetMapping("/board/delete")
		public String deleteBoard(@RequestParam int num,@RequestParam int currentPage)
		{
			//����
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
			//�ش� ���� ����
			boardFileService.deletePhoto(idx);
		}

		//�Խ��� ����
		@PostMapping("/board/updateboard")
		public String updateBoard(
				@ModelAttribute BoardDto dto,
				@RequestParam int currentPage,
				@RequestParam List<MultipartFile> upload,
				HttpServletRequest request,
				HttpSession session
				)
		{
			//���� ���ε��� ���
			String path=request.getSession().getServletContext().getRealPath("/resources/upload");
			
			//����
			boardService.updateBoard(dto);
			
			//������ ���ε�
			//���� ���ε带 ��������� ����Ʈ�� ù����Ÿ�� ���ϸ��� ���ڿ��� �ȴ�
			//�� ���ε�������쿡�� db �� ������ �Ѵ�
			if(!upload.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile multi:upload)
				{
					//���� ���ϸ� ����
					String fileName=UUID.randomUUID().toString();
					//���ε�
					try {
						multi.transferTo(new File(path+"/"+fileName));
						//������ ���� db �� insert �Ѵ�
						BoardFileDto fdto=new BoardFileDto();
						fdto.setNum(dto.getNum());
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

			//������ ���뺸��� �̵��Ѵ�
			return "redirect:./content?currentPage="+currentPage+"&num="+dto.getNum();
		}
		*/

}

