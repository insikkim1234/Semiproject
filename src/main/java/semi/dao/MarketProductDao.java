package semi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.MarketBoardDto;
import semi.dto.MarketProductDto;

@Repository
public class MarketProductDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.MarketProductDao.";
	
	
	
	public void insertMarketProduct(MarketProductDto dto) {
		session.insert(nameSpace + "insertMarketProduct", dto);
	}
	
	public MarketProductDto getData(int boardSeq)
	{
		return session.selectOne(nameSpace+"selectDataByProductBoardSeq", boardSeq);
	}
	
	public void updateMarketProduct(MarketProductDto pdto)
	{
		session.update(nameSpace+"updateMarketProduct",pdto);
	}
}
