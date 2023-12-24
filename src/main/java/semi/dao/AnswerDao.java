package semi.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dto.AnswerDto;

@Repository
public class AnswerDao {
	@Autowired
	private SqlSession session;
	
	private String nameSpace="semi.dao.AnswerDao.";
	
	public void insertAnswer(AnswerDto adto)
	{
		session.insert(nameSpace+"insertAnswer", adto);
	}
	
	public List<AnswerDto> getAnswers(int comBoardCommentSeq)
	{
		return session.selectList(nameSpace+"selectAnswerByNum",comBoardCommentSeq);
	
	}
	public void deleteAnswer(int comBoardCommentIdx)
	{
		session.delete(nameSpace+"deleteAnswer", comBoardCommentIdx);
	}
}