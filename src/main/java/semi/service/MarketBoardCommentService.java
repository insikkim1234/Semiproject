package semi.service;


import org.springframework.stereotype.Repository;

import semi.dao.MarketBoardCommentDao;
import semi.dto.MarketBoardCommentDto;

@Repository
public class MarketBoardCommentService {
	private MarketBoardCommentDao marketBoardCommentDao;
	
	public void insertComment(MarketBoardCommentDto mcdto)
	{
		//marketBoardCommentDao.insertComment(mcdto);
	}
}
