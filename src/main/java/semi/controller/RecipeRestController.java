package semi.controller;

import java.util.List;

import naver.storage.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
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



	//dto 불러오기
	@GetMapping("/recipe/view")
	public List<RecipeDto> getAllRecipe(){
		return recipeDao.getAlltRecipe();
	}

	// region RecipeOrder

	@GetMapping("recipe/orderView/{recipeIdx}")
	public List<RecipeOrderDto> getRecipeOrdersById(@PathVariable int recipeIdx) {
		return recipeOrderService.getRecipeOrdersById(recipeIdx);
	}
}
