package semi.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
    private String userSeq;
    private String userName;
    private String userEmail;
    private String userPassword;
    private String userImage;
    private String userPhoneNumber;

    public MemberDto(String userEmail) {
        this.userEmail = userEmail;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userImage='" + userImage + '\'' +
                ", userPhoneNumber='" + userPhoneNumber + '\'' +
                '}';
    }

}