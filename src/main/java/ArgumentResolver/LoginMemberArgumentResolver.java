package ArgumentResolver;

import annotation.Login;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import semi.dto.MemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static semi.config.MemberConstants.LOGIN_MEMBER_DTO;

@Component
public class LoginMemberArgumentResolver implements HandlerMethodArgumentResolver {
    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        boolean hasLoginAnnotation = methodParameter.hasParameterAnnotation(Login.class);
        boolean hasMemberType = MemberDto.class.isAssignableFrom(methodParameter.getParameterType());
        return hasLoginAnnotation && hasMemberType;
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception {
        HttpServletRequest request = (HttpServletRequest) nativeWebRequest.getNativeRequest();
        HttpSession session = request.getSession(false);
        if (session == null) return null;

        return session.getAttribute(LOGIN_MEMBER_DTO);
    }
}
