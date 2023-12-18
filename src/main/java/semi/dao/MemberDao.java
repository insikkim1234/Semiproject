package semi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import semi.dto.MemberDto;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    //중복 닉네임 체크로직
    public int duplicatedNickNameCheck(MemberDto dto) {
        return session.selectOne(nameSpace + "checkDuplicatedNickName", dto);
    }
    //로그인 체크로직
    public List<MemberDto> loginExecute(MemberDto dto) {
        return session.selectList(nameSpace + "loginCheck", dto);
    }

    public List<MemberDto> getSearchMember(String field, String word)
    {
        word=word==null || word.length()==0?null:word;

        Map<String, String> map = new HashMap<String, String>();
        map.put("searchfield",field);
        map.put("searchword", word);

        return session.selectList(nameSpace+"selectAllMembers", map);
    }

    public MemberDto getData(String userEmail) {
        return session.selectOne(nameSpace +"selectDataById", userEmail);
    }

    public MemberDto getData(int userSeq) {
        return session.selectOne(nameSpace +"selectDataByNum", userSeq);
    }

}