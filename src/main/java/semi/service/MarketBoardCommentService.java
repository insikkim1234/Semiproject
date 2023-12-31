package semi.service;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import semi.dao.MarketBoardCommentDao;
import semi.dto.MarketBoardCommentDto;

@Repository
public class MarketBoardCommentService {
	@Autowired
	private MarketBoardCommentDao marketBoardCommentDao;
	
	public int insertComment(MarketBoardCommentDto mcdto)
	{
		return marketBoardCommentDao.insertComment(mcdto);
	}
	
	public List<MarketBoardCommentDto> getAnswerBoard(int boardSeq)
	{
		return marketBoardCommentDao.getAnswerBoard(boardSeq);	// getAnswerBoard 가 무슨 뜻?
	}
	
	public int getTotalCount(int boardSeq)
	{
		return marketBoardCommentDao.getTotalCount(boardSeq);
	}
	
	public void deleteAnswer(int commentSeq)
	{
		marketBoardCommentDao.deleteAnswer(commentSeq);
	}

	public MarketBoardCommentDto selectAnswerBySeq(int commentSeq)
	{
		return marketBoardCommentDao.selectAnswerBySeq(commentSeq);
	}
}
