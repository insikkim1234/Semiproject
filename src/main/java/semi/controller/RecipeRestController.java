package semi.controller;

import java.util.HashMap;
import java.util.List;

import naver.storage.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
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

@RestController
public class RecipeRestController {
	@Autowired private RecipeDao recipeDao;
	@Autowired private RecipeOrderService recipeOrderService;
	@Autowired private RecipeService recipeService;


	//dto 불러오기
	@GetMapping("/recipe/view")
	@ResponseBody HashMap<String,Object> getSearchList(
			@RequestParam(required = false) String word)
    {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		//총 레시피 개수 얻기
        int totalCount = recipeService.getTotalCount(word);
        
        resultMap.put("data", recipeDao.getSearchRecipe(word));
        resultMap.put("totalCount", totalCount);
        
       return resultMap;
    }
	
	

	// region RecipeOrder

	@GetMapping("recipe/orderView/{recipeIdx}")
	public List<RecipeOrderDto> getRecipeOrdersById(@PathVariable int recipeIdx) {
		return recipeOrderService.getRecipeOrdersById(recipeIdx);
	}
}
