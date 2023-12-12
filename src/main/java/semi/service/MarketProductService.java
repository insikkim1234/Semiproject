package semi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import semi.dao.MarketProductDao;
import semi.dto.MarketProductDto;


@Service
@AllArgsConstructor
public class MarketProductService {

private MarketProductDao marketProductDao;
	
	public void insertProductImage(MarketProductDto dto)
	{
		marketProductDao.insertProductImage(dto);
	}
	
	public List<String> getProductImageByNBoardSeq(int nBoardSeq)
	{
		return marketProductDao.getProductImageByNBoardSeq(nBoardSeq);
	}
	
	public List<MarketProductDto> getFileDataByNBoardSeq(int nBoardSeq)
	{
		return marketProductDao.getFileDataByNBoardSeq(nBoardSeq);
	}
	
	public void deleteProductImage(int nProductSeq)
	{
		marketProductDao.deleteProductImage(nProductSeq);
	}
	
}
