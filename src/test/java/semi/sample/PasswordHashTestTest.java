package semi.sample;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.Assert.*;

@Slf4j
public class PasswordHashTestTest {

    @Test
    public void checkValidPassword() {
        String rawPw = "dd";
        String encodedPw = "$2a$10$KQdhIgNb83dRa3TrpvB0FuTHc4PCamLs3ddo7NkhZzq1o0J06B3FW";

        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        boolean isValid = bCryptPasswordEncoder.matches(rawPw, encodedPw);

        assert (isValid);
    }


    @Test
    public void checkGeneratedPassword() {
        String rawPw = "dd";
        String encodedPw ;

        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        encodedPw = bCryptPasswordEncoder.encode(rawPw);

        log.info(rawPw);
        log.info(encodedPw);

        boolean isValid = bCryptPasswordEncoder.matches(rawPw, encodedPw);

        assert (isValid);
    }
}