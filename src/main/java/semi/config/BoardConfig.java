package semi.config;


import lombok.Getter;
import org.springframework.context.annotation.Configuration;

@Configuration
@Getter
public class BoardConfig {
    private final int PAGE_SIZE = 10;
    private final int BLOCK_SIZE = 2;
}
