package semi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<RecipeDto> getAlltRecipe(){
		
		return session.selectList(nameSpace + "selectAlltRecipe");
	}
	
	public void updateViewCount(int recipeIdx) {
		session.update(nameSpace + "updateViewCount", recipeIdx);
	}

	public int getTotalCount(String word)
	{
		//word에 검색단어가 안들어 있을 경우 null값을 보내야 where문이 실행안된다
	      word=word==null || word.length()==0?null:word;
		return session.selectOne(nameSpace+"totalCountOfRecipe",word);
	}
	
	 public List<RecipeDto> getSearchRecipe(String word)
	   {
	      //word에 검색단어가 안들어 있을 경우 null값을 보내야 where문이 실행안된다
	      word=word==null || word.length()==0?null:word;
	      
	       
	      return session.selectList(nameSpace+"selectAlltRecipe",word);
	   }

	
	public RecipeDto getData(int recipeIdx) {
		return session.selectOne(nameSpace + "selectDataBynRecipeIdx", recipeIdx);
	}
}