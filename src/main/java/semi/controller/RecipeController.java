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
import org.springframework.web.multipart.MultipartFile;

import naver.storage.NcpObjectStorageService;
import semi.dao.RecipeDao;
import semi.dto.RecipeDto;
import semi.service.RecipeService;

@Controller
public class RecipeController {
    @Autowired
    private RecipeService recipeService;

    @Autowired
    private RecipeDao recipeDao;
    
    @Autowired
    NcpObjectStorageService storageService;
    
    // 스토리지 연결 - 사진 업로드
    String storagename = "semi-project-eatingalone";
    String storagefolder = "photo";
    @GetMapping("/recipe/sample")
    public String sample() {
        return "recipe/recipeSample";
    }
    
    // 레시피 게시판
    @GetMapping("/recipe/board")
    public String getRecipeList(Model model) {
        //총 레시피 개수 얻기
        int totalCount = recipeDao.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        return "recipe/recipeBoard";
    }

    // 레시피 업로드 된 사진 스토리지에 업로드 
    @PostMapping("/recipe/insertRecipeApi")
    public String insertRecipeApi(@ModelAttribute RecipeDto dto, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload) {

        String photo=storageService.uploadFile(storagename, storagefolder, upload);
   
        dto.setSRecipePhoto(photo);
        recipeService.insertRecipe(dto);

        return "redirect:../";
    }
    
    // 레시피 게시물 상세 페이지
    @GetMapping("/recipe/board/detail")
    public String detail(Model model, @RequestParam int nRecipeIdx) {
    	// 조회수 증가
    	recipeService.updateViewCount(nRecipeIdx);
    	
    	// nRecipeIdx에 해당하는 dto 얻기
    	RecipeDto dto = recipeService.getData(nRecipeIdx);
    	
    	model.addAttribute("dto", dto);
    	
    	return "recipe/recipeBoardDetail";
    }
	
}
