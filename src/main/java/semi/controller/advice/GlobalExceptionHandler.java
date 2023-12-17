package semi.controller.advice;

import semi.customException.NotLoggedInException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler  {
    @ExceptionHandler(semi.customException.NotLoggedInException.class)
    public String handleNotLoggedInException(NotLoggedInException ex) {
        return "redirect:/member/login";
    }
}
