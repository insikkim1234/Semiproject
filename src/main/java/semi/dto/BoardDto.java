package semi.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class BoardDto {
@JsonProperty("nComBoardSeq")//num
private  int nComBoardSeq;
@JsonProperty("sUserName")//writer
private String sUserName;
@JsonProperty("sUserEmail")
private String sUserEmail;
@JsonProperty("sComBoardSubject")
private String sComBoardSubject;
@JsonProperty("sComBoardContent")
private String sComBoardContent;
@JsonProperty("nComBoardviewCount")
private int nComBoardviewCount;
@JsonProperty("nComBoardRegroup")//photo
private String nComBoardRegroup;
@JsonProperty("nComBoardRestep")
private int nComBoardRestep;
@JsonProperty("nComBoardRelevel")
private int nComBoardRelevel;
@JsonProperty("dtWriteDay")
private Timestamp dtWriteDay;


}
