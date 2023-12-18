package semi.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
    private int userSeq;
    private String userEmail;
    private String userPassword;
    private String userNickName;
    private String userName;
    private String userPhoneNumber;
    private String userImage;


    public MemberDto(String userEmail) {
        this.userEmail = userEmail;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "userName='" + userEmail + '\'' +
                ", userEmail='" + userPassword + '\'' +
                ", userEmail='" + userNickName + '\'' +
                ", userPassword='" + userName + '\'' +
                ", userImage='" + userPhoneNumber + '\'' +
                ", userPhoneNumber='" + userImage + '\'' +
                '}';
    }

}