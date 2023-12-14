package semi.config;

import org.springframework.context.annotation.Configuration;

import lombok.Getter;

@Configuration
@Getter
public class MarketBoardConfig {
	private int PAGE_SIZE = 10;
}
