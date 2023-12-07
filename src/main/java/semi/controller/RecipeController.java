package semi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import semi.dao.RecipeDao;
import semi.dto.RecipeDto;
import semi.service.RecipeService;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService recipeService;
	
	@Autowired
	private RecipeDao recipeDao;
	
	@GetMapping("/recipe/sample")
	public String sample() {
		return "recipe/recipeSample";
	}
	
	@PostMapping("/recipe/insertRecipeApi")
	public String insertRecipeApi(@ModelAttribute RecipeDto dto, HttpServletRequest request, HttpSession session, @RequestParam List<MultipartFile> upload) {
		
		// 파일 업로드 할 경로
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		String realPath = "";
		if(!upload.get(0).getOriginalFilename().equals("")) {
			for(MultipartFile multi : upload) {
				// 랜덤 사진명 생성
				String photo = UUID.randomUUID().toString();
				String extension = multi.getOriginalFilename().substring(multi.getOriginalFilename().lastIndexOf("."));
				realPath = path + "/" + photo + extension;
				// 업로드
				try {
					multi.transferTo(new File(realPath));
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		dto.setSRecipePhoto(realPath);
		recipeService.insertRecipe(dto);
		
		return "redirect:/";
	}
}
