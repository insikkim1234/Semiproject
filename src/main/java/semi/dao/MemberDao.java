package semi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import semi.dto.MemberDto;

@Repository
public class MemberDao {
    @Autowired
    private SqlSession session;

    private String nameSpace = "semi.dao.MemberDao.";

    public int insertMember(MemberDto dto) {
        return session.insert(nameSpace + "insertMember", dto);
    }

    //중복 회원가입 체크로직
    public int duplicatesEmailCheck(MemberDto dto) {
        return session.selectOne(nameSpace + "checkDuplicatedEmail",dto);
    }

    public int loginExecute(MemberDto dto) {
        return session.selectOne(nameSpace + "loginCheck", dto);
    }
}