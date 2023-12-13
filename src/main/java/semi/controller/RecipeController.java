package semi.controller;

import naver.storage.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import semi.dao.RecipeDao;
import semi.dto.RecipeDto;
import semi.dto.RecipeOrderDto;
import semi.service.RecipeOrderService;
import semi.service.RecipeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class RecipeController {
    @Autowired private RecipeOrderService recipeOrderService;
    @Autowired private RecipeService recipeService;
    @Autowired NcpObjectStorageService storageService;
    @Autowired private RecipeDao recipeDao;
    
    @GetMapping("/recipe/sample")
    public String sample() {
        return "recipe/recipeSample";
    }
    
    // 레시피 게시판
    @GetMapping("/recipe/board")
    public String getRecipeList(Model model,String word) {
        //총 레시피 개수 얻기
        int totalCount = recipeService.getTotalCount(word);
        model.addAttribute("totalCount", totalCount);
        return "recipe/recipeBoard";
    }
    
  


    @PostMapping("/recipe/insertRecipe")
    public String insertRecipe(@ModelAttribute RecipeDto dto, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload) {
        String photo=storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
                NcpObjectStorageService.DIR_PHOTO, upload);

        dto.setRecipePhoto(photo);
        recipeService.insertRecipe(dto);

        return "redirect:../";
    }

    @GetMapping("/recipe/orderSample/{recipeIdx}")
    public String getRecipeDetail(Model model, @PathVariable int recipeIdx) {
        List<RecipeOrderDto> dto = recipeOrderService.getRecipeOrdersById(recipeIdx);
        model.addAttribute("recipeOrderDtoList", dto);
        model.addAttribute("recipeIdx", recipeIdx);

        return "recipe/recipeSample/" + recipeIdx;
    }
    
    // 레시피 게시물 상세 페이지
    @GetMapping("/recipe/board/{recipeIdx}")
    public String detail(Model model, @PathVariable int recipeIdx) {
    	// 조회수 증가
    	recipeService.updateViewCount(recipeIdx);
    	
    	// nRecipeIdx에 해당하는 dto 얻기
    	RecipeDto dto = recipeService.getData(recipeIdx);
    	
    	model.addAttribute("dto", dto);
    	
        List<RecipeOrderDto> orderDto = recipeOrderService.getRecipeOrdersById(recipeIdx);
        model.addAttribute("recipeOrderDtoList", orderDto);
        model.addAttribute("recipeIdx", recipeIdx);
    	
    	return "recipe/recipeBoardDetail/" + recipeIdx;
    }
	
}
