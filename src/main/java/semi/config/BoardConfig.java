package semi.config;


import lombok.Getter;
import org.springframework.context.annotation.Configuration;

@Configuration
@Getter
public class BoardConfig {
    public static final int PAGE_SIZE = 10;
    public static final int BLOCK_SIZE = 2;
}
