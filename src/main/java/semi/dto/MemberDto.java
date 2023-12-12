package semi.dto;

import lombok.Data;

@Data
public class MemberDto {
    private int userSeq;
    private String userName;
    private String userEmail;
    private String userPassword;
    private String userImage;
    private String userPhoneNumber;

}