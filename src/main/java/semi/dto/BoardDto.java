package semi.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
    private  int comBoardSeq;
    private String comBoardSubject;
    private String comBoardContent;
    private int comBoardviewCount;
    private String comBoardRegroup;
    private int comBoardRestep;
    private int comBoardRelevel;
    private Timestamp writeDay;
    private int acount;//댓글 개수 추가

    private String comBoardUserSeq;
    private String userName;
}
