package semi.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.MarketBoardDto;

@Repository
public class MarketBoardDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.MarketBoardDao.";
	
	public int getTotalCount()
	{
		return session.selectOne(nameSpace+"totalCountOfBoard");
	}
	
	public List<MarketBoardDto> getList(Map<String, Integer> map)
	{
		return session.selectList(nameSpace+"selectPagingOfBoard", map);
	}
	
	public int getMaxNum()
	{
		return session.selectOne(nameSpace+"selectMaxNumOfBoard");
	}
	
	public void updateRestep(Map<String, Integer> map)
	{
		session.update(nameSpace+"updateRestepOfBoard", map);
	}
	
	public void insertBoard(MarketBoardDto dto)
	{
		session.insert(nameSpace+"insertBoard", dto);
	}
	
	public void updateReadCount(int num)
	{
		session.update(nameSpace+"updateReadCountOfBoard", num);
	}
	
	public MarketBoardDto getData(int num)
	{
		return session.selectOne(nameSpace+"selectDataByNum", num);
	}
	
	public void updateBoard(MarketBoardDto dto)
	{
		session.update(nameSpace+"updateBoard", dto);
	}
	
	public void deleteBoard(int num)
	{
		session.delete(nameSpace+"deleteBoard", num);
	}
	
}

