package semi.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class MarketProductDto {
	@JsonProperty("nProductSeq")
	private int nProductSeq;
	@JsonProperty("nBoardSeq")
	private int nBoardSeq;
	@JsonProperty("nProductPrice")
	private int nProductPrice;
	@JsonProperty("sProductPlace")
	private String sProductPlace;
	@JsonProperty("sProductImage1")
	private String sProductImage1;
	@JsonProperty("sProductImage2")
	private String sProductImage2;
	@JsonProperty("sProductContent")
	private String sProductContent;
}
