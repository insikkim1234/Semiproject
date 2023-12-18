package semi.service;


import semi.dao.MarketBoardCommentDao;
import semi.dto.MarketBoardCommentDto;

public class MarketBoardCommentService {
	private MarketBoardCommentDao marketBoardCommentDao;
	
	public void insertComment(MarketBoardCommentDto mcdto)
	{
		marketBoardCommentDao.insertComment(mcdto);
	}
}
