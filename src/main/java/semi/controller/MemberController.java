package semi.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import semi.dto.MemberDto;
import semi.service.MemberService;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;
    @GetMapping("/save")
    public String saveForm() {
        return "loginviews/save";
    }

//    @PostMapping("/save")
//    public String save(@ModelAttribute MemberDto memberDto) {
//        int saveResult = memberService.save(memberDto);
//        if (saveResult > 0) {
//            return "login";
//        } else {
//            return "save";
//        }
//    }
}
