package semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.dao.AnswerDao;
import semi.dto.AnswerDto;

import java.util.List;

@Repository
public class BoardAnswerService {
    @Autowired
    private AnswerDao answerDao;

    public void insertAnswer(AnswerDto adto)
    {
        answerDao.insertAnswer(adto);
    }

    public List<AnswerDto> getAnswers(int comBoardCommentSeq) {
        return answerDao.getAnswers(comBoardCommentSeq);
    }
}
