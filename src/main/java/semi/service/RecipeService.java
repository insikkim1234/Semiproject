package semi.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import semi.dao.RecipeDao;
import semi.dto.PageInfo;
import semi.dto.RecipeDto;

import java.util.List;

@Service
@AllArgsConstructor
public class RecipeService {
	
	private RecipeDao recipeDao;
	
	public int insertRecipe(RecipeDto dto) {
		return recipeDao.insertRecipe(dto);
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
	
	// 레시피 수정
	public void updateRecipe(RecipeDto updateDto) {
	    recipeDao.updateRecipe(updateDto);
	}
	
	//레시피 삭제
	public void deleteRecipe(int recipeIdx) {
		recipeDao.deleteRecipe(recipeIdx);
	}

	public List<RecipeDto> getRecipeBySearchWord(String searchWord, PageInfo pageInfo) {
		return recipeDao.getRecipeBySearchWord(searchWord, pageInfo);
	}

}
