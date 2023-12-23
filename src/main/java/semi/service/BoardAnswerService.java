package semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dao.AnswerDao;
import semi.dto.AnswerDto;

@Repository
public class BoardAnswerService {
@Autowired
private AnswerDao answerDao;

private int insertComment(AnswerDto adto)
{
	return answerDao.insertComment(adto);
	
}



}
