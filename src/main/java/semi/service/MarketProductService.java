package semi.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import semi.dao.MarketProductDao;
import semi.dto.MarketBoardDto;
import semi.dto.MarketProductDto;

@Service
@AllArgsConstructor
public class MarketProductService {
	private MarketProductDao marketProductDao;
	
	public void insertMarketProduct(MarketProductDto dto) {
		marketProductDao.insertMarketProduct(dto);
	}
	
	public MarketProductDto getData(int boardSeq)
	{
		return marketProductDao.getData(boardSeq);
	}
	public void updateMarketProduct(MarketProductDto pdto)
	{
		marketProductDao.updateMarketProduct(pdto);
	}
}
