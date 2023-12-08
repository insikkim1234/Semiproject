package semi.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import semi.dao.MemberDao;
import semi.dto.MemberDto;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberDao memberDao;

    public void insertMember(MemberDto dto) {
        memberDao.insertMember(dto);
    }
}
