package semi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.MarketProductDto;


@Repository
public class MarketProductDao {

	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.MarketProductDao.";
	
	public void insertProductImage(MarketProductDto dto)
	{
		session.insert(nameSpace+"insertProductImageOfFile", dto);
	}
	
	public List<String> getProductImageByNBoardSeq(int nBoardSeq)
	{
		return session.selectList(nameSpace+"selectAllProductImageByNum", nBoardSeq);
	}
	
	public List<MarketProductDto> getFileDataByNBoardSeq(int nBoardSeq)
	{
		return session.selectList(nameSpace+"selectAllDataByNum", nBoardSeq);
	}
	
	public void deleteProductImage(int nProductSeq)
	{
		session.delete(nameSpace+"deleteProductImageByNProductSeq", nProductSeq);
	}
	
	
}
