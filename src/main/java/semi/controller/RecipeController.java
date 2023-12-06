package semi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String sample(@ModelAttribute RecipeDto dto, HttpServletRequest request, HttpSession session) {
		
		String sRecipeTitle = (String)session.getAttribute("sRecipeTitle");
		String sRecipeName = (String)session.getAttribute("sRecipeName");
		String sRecipePhoto = (String)session.getAttribute("sRecipeName");
		String sRecipeContent = (String)session.getAttribute("sRecipeContent");
		String sRecipeTime = (String)session.getAttribute("sRecipeTime");
		String sRecipeDifficulty = (String)session.getAttribute("sRecipeDifficulty");
		String sRecipeServing = (String)session.getAttribute("sRecipeServing");
		String sRecipeIngredient = (String)session.getAttribute("sRecipeIngredient");
		
		dto.setSRecipeTitle(sRecipeTitle);
		dto.setSRecipeName(sRecipeName);
		dto.setSRecipePhoto(sRecipePhoto);
		dto.setSRecipeContent(sRecipeContent);
		dto.setSRecipeTime(sRecipeTime);
		dto.setSRecipeDifficulty(sRecipeDifficulty);
		dto.setSRecipeServing(sRecipeServing);
		dto.setSRecipeIngredient(sRecipeIngredient);
		
		recipeService.insertRecipe(dto);
		
		return "recipe/recipeSample";
	}
}
