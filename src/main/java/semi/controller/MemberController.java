package semi.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import semi.dto.MemberDto;
import semi.service.MemberService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private MemberService memberService;

    @Configuration
    public class JacksonConfig {

        @Bean
        public ObjectMapper objectMapper() {
            return new ObjectMapper();
        }
    }

    //회원가입 페이지 보여주는 메서드.
    @GetMapping("/register")
    public String saveForm() {
        return "loginviews/register";
    }

    //회원가입 중복 아이디 체크 로직 (API)
    @PostMapping("/duplicatedEmailCheck")
    public ResponseEntity<?> duplicatedEmailCheck(@RequestBody MemberDto memberDto) throws JsonProcessingException {
        int result = memberService.duplicatedEmailCheck(memberDto);
        HashMap<String,String> resultMap = new HashMap<>();

        //중복 회원이 있을 경우
        if(result == 1){
            resultMap.put("status","500");
            resultMap.put("message","이미 가입된 아이디가 존재합니다!");
        }
        //중복 회원이 없을 경우
        else {
            resultMap.put("status","200");
            resultMap.put("message","사용 가능한 아이디 입니다.");
        }
        String duplicatedResult = objectMapper.writeValueAsString(resultMap);
        return ResponseEntity.ok(duplicatedResult);
    }

    //회원가입 실행 로직 메서드 -> 성공 login.jsp 실패 register.jsp
    @PostMapping("/register")
    public String register(@ModelAttribute MemberDto memberDto) {
        int result = memberService.insertMember(memberDto);

        //DB 에서 변경된 행이 1이면 회원가입 성공.
        if (result == 1){
            return "loginviews/login";
        }
        return "loginviews/register";
    }

    // 로그인 실행 로직 메서드
    @PostMapping("/login")
    public String loginExcute(@ModelAttribute MemberDto memberDto, HttpSession httpSession, RedirectAttributes redirectAttributes) {

//        System.out.println("여긴왔니?");
//        System.out.println(memberDto.getSUserEmail());
//        System.out.println(memberDto.getSUserPassword());
        int result = memberService.loginExecute(memberDto);
//        int result = 1;
        if (result == 1){
            httpSession.setAttribute("sUserEmail",memberDto.getSUserEmail());
//            System.out.println("로그인 성공");
            return "redirect:./login";
            
        }

        redirectAttributes.addFlashAttribute("message","아이디 혹은 비밀번호를 확인해주세요");
//        System.out.println("로그인 실패");
        return "redirect:/";
        
    }

    // 로그인 Page 보여주는 메서드
    @GetMapping("/login")
    public String loginPage(){
        return "loginviews/login";
    }
    
    
}