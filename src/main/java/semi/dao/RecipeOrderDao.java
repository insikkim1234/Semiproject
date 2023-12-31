package semi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import semi.dto.RecipeOrderDto;

import java.util.List;

@Repository
public class RecipeOrderDao {
	@Autowired
	private SqlSession session;

	private String nameSpace = "semi.dao.RecipeOrderDao.";
	
	public List<RecipeOrderDto> getRecipeOrdersById(int recipeIdx) {
		return session.selectList("getRecipeOrdersById", recipeIdx);
	}

	public void insertOrderRecipe(RecipeOrderDto orderdto) {
		session.insert(nameSpace + "insertOrderRecipe", orderdto);
	}
	
    public void upsertRecipeOrder(RecipeOrderDto orderDto) {
        session.insert(nameSpace + "upsertRecipeOrder", orderDto);
    }
    
    public void deleteOrderRecipe(RecipeOrderDto orderDto) {
		session.delete(nameSpace + "deleteOrderRecipe", orderDto);
	}
    
    public void deleteRecipeOrderBySeq(int seq) {
		session.delete(nameSpace + "deleteRecipeOrderBySeq", seq);
	}
}