package semi.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnswerDto {
	private int nComBoardCommentIdx;
	private int nComBoardCommentSeq; //num
	private String sComBoardCommentName;
	private String sComBoardCommentMsg;
	private Timestamp dtWriteday;
	
}
