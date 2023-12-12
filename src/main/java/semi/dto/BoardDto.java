package semi.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class BoardDto {
@JsonProperty("nComBoardSeq")
private  int nComBoardSeq;
@JsonProperty("sUserName")
private String sUserName;
@JsonProperty("sUserEmail")
private String sUserEmail;
@JsonProperty("sComBoardSubject")
private String sComBoardSubject;
@JsonProperty("sComBoardContent")
private String sComBoardContent;
@JsonProperty("nComBoardviewCount")
private int nComBoardviewCount;
@JsonProperty("nComBoardRegroup")
private int nComBoardRegroup;
@JsonProperty("nComBoardRestep")
private int nComBoardRestep;
@JsonProperty("nComBoardRelevel")
private int nComBoardRelevel;
@JsonProperty("dtWriteDay")
private Timestamp dtWriteDay;
}
