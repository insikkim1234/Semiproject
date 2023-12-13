package semi.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class MarketBoardDto {
	@JsonProperty("nBoardSeq")
	private int nBoardSeq;
	@JsonProperty("nUserSeq")
	private int nUserSeq;
	@JsonProperty("sBoardTitle")
	private String sBoardTitle;
	@JsonProperty("sBoardImage")
	private String sBoardImage;
	@JsonProperty("nBoardReplyCount")
	private int nBoardReplyCount;
	@JsonProperty("nBoardViewCount")
	private int nBoardViewCount;
	@JsonProperty("dtCreateDate")
	private Timestamp dtCreateDate;	
	@JsonProperty("dtUpdateDate")
	private Timestamp dtUpdateDate;	
}

