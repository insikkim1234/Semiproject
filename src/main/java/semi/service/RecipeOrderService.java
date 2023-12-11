package semi.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import semi.dao.RecipeOrderDao;
import semi.dto.RecipeOrderDto;

import java.util.List;

@Service
@AllArgsConstructor
public class RecipeOrderService {
	
	private RecipeOrderDao recipeOrderDao;
	
	public List<RecipeOrderDto> getRecipeOrdersById(int recipeIdx) {
		return recipeOrderDao.getRecipeOrdersById(recipeIdx);
	}
}
