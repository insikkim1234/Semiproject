 package semi.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class MarketBoardDto {
	private int boardSeq;
	private int userSeq;
	private String boardTitle;
	private String boardImage;
	private int boardReplyCount;
	private int boardViewCount;
	private Timestamp createDate;	
	private Timestamp updateDate;	
}

