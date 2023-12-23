package semi.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.util.StringUtils;
import lombok.RequiredArgsConstructor;
import naver.storage.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import semi.config.MemberConstants;
import semi.dto.MemberDto;
import semi.service.MemberService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
    @Autowired
    private ObjectMapper objectMapper;
//
    @Autowired
    private MemberService memberService;

    @Autowired NcpObjectStorageService storageService;

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

    //사진 업로드 로직
//    @PostMapping("/register/insertMember")
//    public String insertMember(@ModelAttribute MemberDto dto, HttpServletRequest request, HttpSession session, @RequestParam MultipartFile uploadFile) {
////        String photo=storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
////                NcpObjectStorageService.DIR_PHOTO, uploadFile);
////
////        dto.setUserImage(photo);
////        memberService.insertMember(dto);
//        return "redirect:../";
//    }

    //회원가입 중복 이메일 체크 로직 (API)
    @PostMapping("/duplicatedEmailCheck")
    public ResponseEntity<?> duplicatedEmailCheck(@RequestBody MemberDto memberDto) {
        int result = memberService.duplicatedEmailCheck(memberDto);
        HashMap<String,String> resultMap = new HashMap<>();

        //중복 회원이 있을 경우
        if(result == 1){
            resultMap.put("status","500");
            resultMap.put("message","이미 가입된 이메일이 존재합니다!");
        }
        //중복 회원이 없을 경우
        else {
            resultMap.put("status","200");
            resultMap.put("message","사용 가능한 이메일 입니다.");
        }

        String duplicatedResult = "";
        try {
            duplicatedResult = objectMapper.writeValueAsString(resultMap);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return ResponseEntity.ok(duplicatedResult);
    }

    //회원가입 중복 닉네임 체크 로직 (API)
    @PostMapping("/duplicatedNickNameCheck")
    public ResponseEntity<?> duplicatedNickNameCheck(@RequestBody MemberDto memberDto) {
        int result = memberService.duplicatedNickNameCheck(memberDto);
        HashMap<String,String> resultMap = new HashMap<>();

        //중복 회원이 있을 경우
        if(result == 1){
            resultMap.put("status","500");
            resultMap.put("message","이미 가입된 닉네임이 존재합니다!");
        }
        //중복 회원이 없을 경우
        else {
            resultMap.put("status","200");
            resultMap.put("message","사용 가능한 닉네임 입니다.");
        }

        String duplicatedResult = "";
        try {
            duplicatedResult = objectMapper.writeValueAsString(resultMap);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return ResponseEntity.ok(duplicatedResult);
    }

    //회원가입 실행 로직 메서드 -> 성공 login.jsp 실패 register.jsp
    @PostMapping("/register")
    public String register(@ModelAttribute MemberDto memberDto,@RequestParam("confirmPassword") String confirmPassword,HttpServletRequest request, HttpSession session, @RequestParam MultipartFile uploadFile, Model model) {

        String photo=storageService.uploadFile(NcpObjectStorageService.STORAGE_EATINGALONE,
                NcpObjectStorageService.DIR_PHOTO, uploadFile);

        if (!memberDto.getUserPassword().equals(confirmPassword)) {
            // 비밀번호가 일치하지 않는 경우 처리
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "loginviews/register"; // 에러 발생 시 회원가입 폼 페이지로 리다이렉트
        }

        String encodedPassword = memberService.encodePassword(memberDto.getUserPassword());
        memberDto.setUserPassword(encodedPassword);
        memberDto.setUserImage(photo);

        int result = memberService.insertMember(memberDto);
//      DB 에서 변경된 행이 1이면 회원가입 성공.
        if(result == 1){
            if (uploadFile != null) {
                storageService.uploadFileWithFileName(NcpObjectStorageService.STORAGE_EATINGALONE,
                        NcpObjectStorageService.DIR_USER_PROFILE_PHOTO, uploadFile, String.valueOf(memberDto.getUserSeq()));
            }

            return "loginviews/login";
        }

        return "loginviews/register";
    }

    // 로그인 실행 로직 메서드
    @PostMapping("/login")
    public String loginExcute(@ModelAttribute MemberDto memberDto, HttpSession httpSession, RedirectAttributes redirectAttributes) {

        System.out.println(memberDto);
        MemberDto loginMember = memberService.getMember(memberDto);
        System.out.println(loginMember);
        if (loginMember != null
                && memberService.validatePassword(memberDto.getUserPassword(), loginMember.getUserPassword())) {
            httpSession.setMaxInactiveInterval(60*60*6);
            httpSession.setAttribute(MemberConstants.LOGIN_MEMBER_DTO, loginMember);

            System.out.println("로그인 성공");

            String redirectUrl = (String) httpSession.getAttribute("redirectUrl");
            httpSession.removeAttribute("redirectUrl");

            if (StringUtils.isNullOrEmpty(redirectUrl)) {
                return "redirect:/";
            }
            else {
                return "redirect:" + redirectUrl;
            }
        }

        redirectAttributes.addFlashAttribute("message","아이디 혹은 비밀번호를 확인해주세요");
        System.out.println("로그인 실패");
        return "redirect:./login";
    }

    // 로그아웃 요청 시 세션에 저장된 정보 삭제
    @GetMapping("/logout")
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute(MemberConstants.LOGIN_MEMBER_DTO);
        return "redirect:./login";
    }

    // 로그인 Page 보여주는 메서드
    @GetMapping("/login")
    public String loginPage(){
        return "loginviews/login";
    }
    
    
}