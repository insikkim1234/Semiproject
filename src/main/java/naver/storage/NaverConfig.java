package naver.storage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;

@Configuration
@Setter
@Getter
public class NaverConfig {
	
	@Value("https://kr.object.ncloudstorage.com")
	private String endPoint;
	
	@Value("kr-standard")
	private String regionName;

	@Value("#{env['storage.ACCESSKEY']}")
	private String accessKey;

	@Value("#{env['storage.SECRETKEY']}")
	private String secretKey;
}
