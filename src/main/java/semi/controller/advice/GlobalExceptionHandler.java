package semi.controller.advice;

import com.mysql.cj.util.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import semi.customException.NotLoggedInException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@ControllerAdvice
public class GlobalExceptionHandler  {
    @ExceptionHandler(semi.customException.NotLoggedInException.class)
    public String handleNotLoggedInException(NotLoggedInException ex, HttpSession httpSession) {
        httpSession.setAttribute("redirectUrl", getRequestUri());

        return "redirect:/member/login";
    }

    private String getRequestUri() {
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();

        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();

        if (!StringUtils.isNullOrEmpty(contextPath)) {
            return requestUri.substring(contextPath.length());
        }
        else {
            return requestUri;
        }
    }
}
