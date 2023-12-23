package semi.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberDto {
    private int userSeq;
    private String userEmail;
    private String userPassword;
    private String userNickName;
    private String userName;
    private String userPhoneNumber;
    private String userImage;

}