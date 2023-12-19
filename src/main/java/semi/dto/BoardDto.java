package semi.dto;

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
    private String writeDay;
    private String updateDay;
    private int acount;//댓글 개수 추가
    private String comBoardPhoto;

    private int comBoardUserSeq;
    private String userName;
}
