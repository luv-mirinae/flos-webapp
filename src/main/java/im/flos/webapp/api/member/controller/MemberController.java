package im.flos.webapp.api.member.controller;

import im.flos.webapp.api.member.persistence.MemberDTO;
import im.flos.webapp.api.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
public class MemberController {

    private final MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/api/member/getMemberById")
    public MemberDTO getMemberById(@RequestParam Integer id) {
        log.info("* getMemberById: {}", id);
        return memberService.getMemberById(id);
    }

    @GetMapping("/api/member/getMemberByName")
    public MemberDTO getMemberByName(@RequestParam String name) {
        log.info("* getMemberByName: {}", name);
        return memberService.getMemberByName(name);
    }

    @GetMapping("/api/member/getAllMembers")
    public List<MemberDTO> getAllMembers() {
        log.info("* getAllMembers");
        return memberService.getAllMembers();
    }
}
