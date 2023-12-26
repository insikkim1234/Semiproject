package semi.dao;

import java.util.List;

import com.mysql.cj.util.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.PageInfo;
import semi.dto.RecipeDto;

@Repository
public class RecipeDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace = "semi.dao.RecipeDao.";
	
	public int insertRecipe(RecipeDto dto) {
		return session.insert(nameSpace + "insertRecipe", dto);
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
	
	public List<RecipeDto> getRecipeBySearchWord(String word, PageInfo pageInfo) {
		//word에 검색단어가 안들어 있을 경우 null값을 보내야 where문이 실행안된다
		if (StringUtils.isNullOrEmpty(word)) word = null;

	    int limit = pageInfo.getBoardLimit();
		int currentPage = pageInfo.getCurrentPage();
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
	      
	    return session.selectList(nameSpace+"selectAlltRecipe",word,rowBounds);
	}

	public RecipeDto getData(int recipeIdx) {
		return session.selectOne(nameSpace + "selectDataBynRecipeIdx", recipeIdx);
	}
	
	// 레시피 수정
	public void updateRecipe(RecipeDto updateDto) {
	    session.update(nameSpace + "updateRecipe", updateDto);
	}
	
	//레시피 삭제
	public void deleteRecipe(int recipeIdx) {
		session.delete(nameSpace + "deleteRecipe", recipeIdx);
	   }
	
}