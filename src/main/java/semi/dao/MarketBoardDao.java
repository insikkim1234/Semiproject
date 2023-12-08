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
	
	public void insertMarketBoard(MarketBoardDto dto)
	{
		session.insert(nameSpace+"insertMarketBoard", dto);
	}
	
	public void updateReadCount(int nBoardSeq)
	{
		session.update(nameSpace+"updateReadCountOfBoard", nBoardSeq);
	}
	
	public MarketBoardDto getData(int nBoardSeq)
	{
		return session.selectOne(nameSpace+"selectDataByNBoardSeq", nBoardSeq);
	}
	
	public void updateMarketBoard(MarketBoardDto dto)
	{
		session.update(nameSpace+"updateMarketBoard", dto);
	}
	
	public void deleteMarketBoard(int nBoardSeq)
	{
		session.delete(nameSpace+"deleteMarketBoard", nBoardSeq);
	}
	
}

