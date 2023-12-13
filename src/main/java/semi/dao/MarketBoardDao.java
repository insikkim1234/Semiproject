package semi.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.BoardDto;
import semi.dto.MarketBoardDto;
import semi.dto.MarketProductDto;
import semi.dto.RecipeDto;

@Repository
public class MarketBoardDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.MarketBoardDao.";
	
	public void insertMarketBoard(MarketBoardDto dto) {
		session.insert(nameSpace + "insertMarketBoard", dto);
	}
	
}
