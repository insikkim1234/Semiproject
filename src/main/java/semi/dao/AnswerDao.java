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
	
	public void insertAnswer(AnswerDto dto)
	{
		session.insert(nameSpace+"insertAnswer", dto);
	}
	
	public List<AnswerDto> getAnswers(int nComBoardCommentSeq)
	{
		return session.selectList(nameSpace+"selectAnswerByNum",nComBoardCommentSeq);
	
	}
	public void deleteAnswer(int nComBoardCommentIdx)
	{
		session.delete(nameSpace+"deleteAnswer", nComBoardCommentIdx);
	}
	
	
}