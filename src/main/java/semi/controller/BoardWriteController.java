package semi.controller;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import semi.dao.BoardDao;
import semi.dto.BoardDto;
@Controller
@RequestMapping("/board/list")
@AllArgsConstructor
public class BoardWriteController {
	private BoardDao boardDao;
	@GetMapping("/boardform")
	public String form() {
		return "boardform";
	}
	@PostMapping("/addprocess")
	public String add(HttpServletRequest request, @ModelAttribute BoardDto dto, @RequestParam MultipartFile upload) {
		// 사진을 업로드할 폴더
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		System.out.println(path);
		// 파일명을 랜덤하게 구해서 dto 에 저장
		String photo = UUID.randomUUID().toString();
		if (upload.getOriginalFilename().equals(""))
			dto.setNComBoardRegroup("no"); // 사진을 업로드하지 않은경우는 no 라고 저장해보자
		else
			dto.setNComBoardRegroup(photo);
		// 업로드
		try {
			upload.transferTo(new File(path + "/" + photo));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// db insert
		boardDao.insertBoard(dto);
		return "redirect:./boardlist";
	}
}