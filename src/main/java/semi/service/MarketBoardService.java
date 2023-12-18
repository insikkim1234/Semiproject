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

	public List<MarketBoardDto> getBoardWithPage(int pageNum, int perPage, String searchWord) {
		int startNum = (pageNum - 1) * perPage;
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("perPage", perPage);
		map.put("searchWord", searchWord);

		return marketBoardDao.getBoardWithPage(map);
	}
	
	public int getTotalCount(String searchWord)
	{
		return marketBoardDao.getTotalCount(searchWord);
	}
	
	public void updateReadCount(int boardSeq)
	{
		marketBoardDao.updateReadCount(boardSeq);
	}
	
	public MarketBoardDto getData(int boardSeq)
	{
		return marketBoardDao.getData(boardSeq);
	}

	

	

	

	

	

}

