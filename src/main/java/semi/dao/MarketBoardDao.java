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
	
	public List<MarketBoardDto> getBoardWithPage(Map<String, Object> map)
	{
		return session.selectList(nameSpace+"selectMarketBoardWithPage", map);
	}
	
	public int getTotalCount(String searchWord)
	{
		return session.selectOne(nameSpace+"totalCountOfMarketBoard", searchWord);
	}
	
	public void updateReadCount(int boardSeq)
	{
		session.update(nameSpace+"updateReadCountOfMarketBoard", boardSeq);
	}
	
	public MarketBoardDto getData(int boardSeq)
	{
		return session.selectOne(nameSpace+"selectDataByMarketBoardSeq", boardSeq);
	}
	
	public void deleteMarketBoardContent(int boardSeq)
	{
		session.delete(nameSpace+"deleteMarketBoardContent", boardSeq);
	}
	
}
