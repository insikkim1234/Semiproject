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
}