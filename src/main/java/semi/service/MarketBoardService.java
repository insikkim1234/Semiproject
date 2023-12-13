package semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import semi.dao.MarketBoardDao;
import semi.dto.BoardDto;
import semi.dto.MarketBoardDto;

@Service
@AllArgsConstructor
public class MarketBoardService {
	private MarketBoardDao marketBoardDao;
	
	public void insertMarketBoard(MarketBoardDto dto) {
		marketBoardDao.insertMarketBoard(dto);
	}
	
	

	

	

	

	

	

}

