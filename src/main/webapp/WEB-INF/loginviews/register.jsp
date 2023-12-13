<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>register</title>
    <style>
        .file-input-wrapper {
            width: 300px;
            border: 1px solid gray;
            padding: 10px;
            border-radius: 10px;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }

        .file-input-wrapper input[type=file] {
            width: calc(100% - 22px);
            box-sizing: border-box;
            margin-top: 5px;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
        input[type=text],
        input[type=email],
        input[type=password],
        input[type=submit]{
            width: 300px;
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 10px;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
        .box {
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<form action="/semi/member/register" method="post">
    <input type="text" name="userName" placeholder="성명 입력"><br>
    <div class="box"><input type="email" name="userEmail" placeholder="이메일"><br>
    <label for="emailCheckbox">아이디 중복 확인<input type="checkbox" id="emailCheckbox" /></label></div><br>
    <input type="password" name="userPassword" placeholder="비밀번호"><br>

    <div class="file-input-wrapper">
        <input type="file" name="userImage" placeholder="사진">
    </div><br>

    <input type="text" name="userPhoneNumber"  placeholder="휴대전화번호(Ex:010-1234-5678)"><br>
    <input type="submit" value="회원가입">
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#emailCheckbox').on('change', function() {
            if ($(this).is(':checked')) {
                const userEmail = $('input[name="userEmail"]').val();
                const dataToSend = { userEmail: userEmail };

                $.ajax({
                    type: "GET", // GET 요청 설정
                    dataType: "json",
                    url: "/member/duplicatedEmailCheck",
                    data: dataToSend,
                    success: function(response) {
                        console.log('AJAX 성공', response);
                        // 성공 시 실행할 코드
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX 오류', error);
                        // 오류 시 실행할 코드
                    }
                });

            }
        });
    });
</script>
</body>
</html>