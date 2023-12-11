package semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import semi.dao.RecipeDao;
import semi.dto.RecipeDto;

@RestController
public class RecipeRestController {
	@Autowired
	private RecipeDao recipeDao;
	
	//dto 불러오기
	@GetMapping("/recipe/view")
	public List<RecipeDto> getAllRecipe(){
		return recipeDao.getAlltRecipe();
	}

	@GetMapping("/recipe/selectAllDataTest")
	public String selectAllDataTest(){
		List<RecipeDto> recipeData = recipeDao.getAlltRecipe();

		StringBuilder sb = new StringBuilder();
		for (RecipeDto data: recipeData) {
			sb.append("<p>");
			sb.append(data);
			sb.append("</p>");
		}

		return sb.toString();
	}
}
