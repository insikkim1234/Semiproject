package semi.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
    private  int comBoardSeq;
    private String comBoardSubject;
    private String comBoardContent;
    private int comBoardviewCount;
    private int comBoardRegroup;
    private int comBoardRestep;
    private int comBoardRelevel;
    private Timestamp writeDay;
    private Timestamp updateDay;
    private int acount;//댓글 개수 추가
    private String comBoardPhoto;

    private int comBoardUserSeq;
    private String userName;
    private String userNickName;
}
