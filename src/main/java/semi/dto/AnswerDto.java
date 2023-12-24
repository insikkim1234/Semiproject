package semi.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnswerDto {
	private int comBoardCommentIdx;
	private int comBoardCommentSeq;
	private String comBoardCommentName;
	private String comBoardCommentEmail;
	private String comBoardCommentMsg;
	private Timestamp writeDay;
}
