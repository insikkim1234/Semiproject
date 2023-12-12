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
    @Autowired private RecipeDao recipeDao;
    @Autowired private RecipeService recipeService;
    @Autowired NcpObjectStorageService storageService;

    private String storagename = "semi-project-eatingalone";
    private String storagefolder = "photo";

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

    @PostMapping("/recipe/insertRecipe")
    public String insertRecipe(@ModelAttribute RecipeDto dto, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload) {
        String photo=storageService.uploadFile(storagename, storagefolder, upload);

        dto.setSRecipePhoto(photo);
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

    	// 조회수 증가
    	recipeService.updateViewCount(nRecipeIdx);
    	
    	// nRecipeIdx에 해당하는 dto 얻기
    	RecipeDto dto = recipeService.getData(nRecipeIdx);
    	
    	model.addAttribute("dto", dto);
    	
    	return "recipe/recipeBoardDetail/" + recipeIdx;
    }
	
}
