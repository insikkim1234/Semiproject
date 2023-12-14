package semi.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardDto {
    private  int comBoardSeq;
    private String userName;
    private String userEmail;
    private String comBoardSubject;
    private String comBoardContent;
    private int comBoardviewCount;
    private String comBoardRegroup;
    private int comBoardRestep;
    private int comBoardRelevel;
    private Timestamp writeDay;
}
