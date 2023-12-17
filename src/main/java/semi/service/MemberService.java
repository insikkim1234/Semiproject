package semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import semi.dao.MemberDao;
import semi.dto.MemberDto;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {
    @Autowired
    private final MemberDao memberDao;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public int insertMember(MemberDto dto) {
        return memberDao.insertMember(dto);
    }

    public int duplicatedEmailCheck(MemberDto memberDto) {
        return memberDao.duplicatesEmailCheck(memberDto);
    }

    public List<MemberDto> loginExecute(MemberDto memberDto){
        return memberDao.loginExecute(memberDto);
    }

    public MemberDto getMember(MemberDto memberDto) {
        return memberDao.getData(memberDto.getUserEmail());
    }

    public String encodePassword(String passwd) {
        return passwordEncoder.encode(passwd);
    }

    public boolean validatePassword(String rawPasswd, String encodedPasswd) {
        return passwordEncoder.matches(rawPasswd, encodedPasswd);
    }
}