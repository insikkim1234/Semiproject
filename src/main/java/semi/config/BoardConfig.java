package semi.config;


import lombok.Getter;
import org.springframework.context.annotation.Configuration;

@Configuration
@Getter
public class BoardConfig {
    private int PAGE_SIZE = 10;
}
