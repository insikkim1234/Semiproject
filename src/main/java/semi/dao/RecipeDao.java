package semi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.RecipeDto;

@Repository
public class RecipeDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace = "semi.dao.RecipeDao.";
	
	public void insertRecipe(RecipeDto dto) {
		session.insert(nameSpace + "insertRecipe", dto);
	}
	
	public List<RecipeDto> selectAllRecipe() {
		return session.selectList(nameSpace + "selectAllRecipe");
	}
	
	
}
