package im.flos.webapp.api.member.service;

import im.flos.webapp.api.member.mapper.MemberMapper;
import im.flos.webapp.api.member.persistence.MemberDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Autowired
    public MemberServiceImpl(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

    @Override
    public MemberDTO getMemberById(Integer id) {
        return memberMapper.selectById(id);
    }

    @Override
    public MemberDTO getMemberByName(String name) {
        return memberMapper.selectByName(name);
    }

    @Override
    public List<MemberDTO> getAllMembers() {
        return memberMapper.selectAll();
    }
}
