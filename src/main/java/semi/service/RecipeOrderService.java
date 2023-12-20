package semi.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import semi.dao.RecipeDao;
import semi.dao.RecipeOrderDao;
import semi.dto.RecipeDto;
import semi.dto.RecipeOrderDto;

import java.util.List;

@Service
@AllArgsConstructor
public class RecipeOrderService {
	
	private RecipeOrderDao recipeOrderDao;
	
	public List<RecipeOrderDto> getRecipeOrdersById(int recipeIdx) {
		return recipeOrderDao.getRecipeOrdersById(recipeIdx);
	}
	
	public void insertOrderRecipe(RecipeOrderDto orderdto) {
		recipeOrderDao.insertOrderRecipe(orderdto);
	}
	
	public void upsertRecipeOrder(RecipeOrderDto orderDto) {
        recipeOrderDao.upsertRecipeOrder(orderDto);
    }
	
	public void deleteOrderRecipe(RecipeOrderDto orderDto) {
		recipeOrderDao.deleteOrderRecipe(orderDto);
	}
}
