package semi.dto;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class MemberDto {
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
        return "User{" +
                "userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userImage='" + userImage + '\'' +
                ", userPhoneNumber='" + userPhoneNumber + '\'' +
                '}';
    }

}