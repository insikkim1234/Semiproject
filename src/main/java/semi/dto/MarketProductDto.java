package semi.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class MarketProductDto {
	private int productSeq;
	private int boardSeq;
	private int productPrice;
	private String productPlace;
	private String productImage1;
	private String productImage2;
	private String productContent;
}
