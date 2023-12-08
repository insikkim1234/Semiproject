package semi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import semi.dto.MemberDto;

@Repository
public class MemberDao {
    @Autowired
    private SqlSession session;

    private String nameSpace = "semi.dto.MemberDto.";

    public void insertMember(MemberDto dto) {
        session.insert(nameSpace + "insertMember", dto);
    }
}

