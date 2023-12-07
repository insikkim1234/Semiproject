package semi.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MarketBoardDto {
	private int nBoardSeq;
	private int nUserSeq;
	private String sBoardTitle;
	private String sBoardImage;
	private int nBoardReplyCount;
	private int nBoardViewCount;
	private Timestamp dtCreateDate;	
	private Timestamp dtUpdateDate;	
}
