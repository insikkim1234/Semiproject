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
	
	public List<MarketBoardDto> getList(int start,int perpage)
	{
		//1)map생성
		Map<String, Integer> map=new HashMap<String, Integer>();
		//2)map에 start,perpage넣기
		map.put("start", start);
		map.put("perpage", perpage);
		//3)boardDao의 getList(map)실행
		return marketBoardDao.getList(map);
	}
	
	
	public List<MarketBoardDto> getBoardWithPage(int pageNum, int perPage) {
		int startNum = (pageNum - 1) * perPage;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("perPage", perPage);

		return marketBoardDao.getBoardWithPage(map);
	}
	
	public int getTotalCount()
	{
		return marketBoardDao.getTotalCount();
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

