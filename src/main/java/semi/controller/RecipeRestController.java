package semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import semi.dao.RecipeDao;
import semi.dao.RecipeOrderDao;
import semi.dto.RecipeDto;
import semi.dto.RecipeOrderDto;
import semi.service.RecipeOrderService;

@RestController
public class RecipeRestController {
	@Autowired
	private RecipeDao recipeDao;

	@Autowired
	private RecipeOrderService recipeOrderService;

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
