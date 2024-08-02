package im.flos.webapp.api.member.service;

import im.flos.webapp.api.member.persistence.MemberDTO;

import java.util.List;

public interface MemberService {
    MemberDTO getMemberById(Integer id);
    MemberDTO getMemberByName(String name);
    List<MemberDTO> getAllMembers();
}
