package semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import semi.dao.MemberDao;
import semi.dto.MemberDto;

@Service
@RequiredArgsConstructor
public class MemberService {
    @Autowired
    private final MemberDao memberDao;

    public int insertMember(MemberDto dto) {
        return memberDao.insertMember(dto);
    }

    public int duplicatedEmailCheck(MemberDto memberDto) {
        return memberDao.duplicatesEmailCheck(memberDto);
    }

    public int loginExecute(MemberDto memberDto){
        return memberDao.loginExecute(memberDto);
    }

}