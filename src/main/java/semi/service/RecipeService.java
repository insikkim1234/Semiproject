package semi.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import semi.dao.RecipeDao;
import semi.dto.RecipeDto;

@Service
@AllArgsConstructor
public class RecipeService {
	
	private RecipeDao recipeDao;
	
	public void insertRecipe(RecipeDto dto) {
		recipeDao.insertRecipe(dto);
	}
}
