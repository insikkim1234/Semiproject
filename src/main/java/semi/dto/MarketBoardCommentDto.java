package semi.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class MarketBoardCommentDto {
	private int commentSeq;
	private int boardSeq;
	private int userSeq;
	private String commentContent;
	private Timestamp createDate;	
	private Timestamp updateDate;	
	private int commentParentSeq;
	private int commentDepth;
	
	private String commentUserName;
	private String commentUserEmail;
}
