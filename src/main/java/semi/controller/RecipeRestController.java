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
	@Autowired NcpObjectStorageService storageService;
	@Autowired private RecipeDao recipeDao;
	@Autowired private RecipeOrderService recipeOrderService;
	@Autowired private RecipeService recipeService;


	private String storagename = "semi-project-eatingalone";
	private String storagefolder = "photo";

	//dto 불러오기
	@GetMapping("/recipe/view")
	public List<RecipeDto> getAllRecipe(){
		return recipeDao.getAlltRecipe();
	}

	@PostMapping("/recipe/insertRecipeApi")
	public String insertRecipeApi(@ModelAttribute RecipeDto dto, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile upload) {
		String photo=storageService.uploadFile(storagename, storagefolder, upload);

		dto.setSRecipePhoto(photo);
		recipeService.insertRecipe(dto);

		return "redirect:../";
	}

	// region RecipeOrder

	@GetMapping("recipe/orderView/{recipeIdx}")
	public List<RecipeOrderDto> getRecipeOrdersById(@PathVariable int recipeIdx) {
		return recipeOrderService.getRecipeOrdersById(recipeIdx);
	}
}
