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
	
	public void updateViewCount(int recipeIdx) {
		recipeDao.updateViewCount(recipeIdx);
	}
	
	public RecipeDto getData(int recipeIdx) {
		return recipeDao.getData(recipeIdx);
	}

	public int getTotalCount(String word) {
		return recipeDao.getTotalCount(word);
	}
}
