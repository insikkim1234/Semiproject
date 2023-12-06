package semi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace = "semi.dao.RecipeDao.";
	
}
