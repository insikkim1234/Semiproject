 package semi.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
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
	private String userName;
	private String userNickName;
	
	  @Override
	    public String toString() {
	        return "MarketBoardDto{" +
	                "boardSeq=" + boardSeq +
	                ", userSeq=" + userSeq +
	                ", boardTitle='" + boardTitle + '\'' +
	                ", boardImage='" + boardImage + '\'' +
	                ", boardReplyCount=" + boardReplyCount +
	                ", boardViewCount=" + boardViewCount +
	                ", createDate='" + createDate + '\'' +
	                ", updateDate='" + updateDate + '\'' +
	                '}';
	  }
}

