package semi.dto;

import lombok.Data;

@Data
public class MemberDto {
    private int nUserSeq;
    private String sUserName;
    private String sUserEmail;
    private String sUserPassword;
    private String sUserImage;
    private String sUserPhoneNumber;

}
