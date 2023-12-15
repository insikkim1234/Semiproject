package semi.orderBean;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class OrderBean {
	private String recipeOrderContent;
	private MultipartFile upload;
}