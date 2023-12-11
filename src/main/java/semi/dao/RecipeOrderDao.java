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

	public List<RecipeOrderDto> getRecipeOrderAll(int recipeIdx) {
		return session.selectList("selectRecipeOrderAll", recipeIdx);
	}
}