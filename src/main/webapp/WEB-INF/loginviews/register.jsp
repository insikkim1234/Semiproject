<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>register</title>
    <style>
        .file-input-wrapper {
            width: 300px;
            border: 2px solid #11B560;
            padding: 10px;
            border-radius: 10px;
            display: table;
            margin-left: auto;
            margin-right: auto;
            background-color: #fff;
        }/* 백그라운드색 변경 보더변경 */

        .file-input-wrapper input[type=file] {
            width: calc(100% - 22px);
            box-sizing: border-box;
            margin-top: 5px;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
        .regi_input>input[type=text],
        .regi_input>input[type=password],
        .regi_input>input[type=submit],
        .regi_input>.box>input[type=email]{
            width: 300px;
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 10px;
            display: table;
            margin-left: auto;
            margin-right: auto;
            border: 2px solid #11B560;
        }/* 보더변경하고 색상변경 */
        .box {
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
        
        /*밑에 두 속성 추가  */
        .regi_input>input[type=submit]{
         	border: 2px solid #0e942c;
        }
         
        .regi_input>input[type=submit]:hover{
			border: 2px solid #e1a900;
        }
    </style>
</head>
<body style="background-color: #eeefc7b8;">
<div class="fs_40 text-center cGreen fw_600 my-3">JOIN US</div>
<form action="/semi/member/register" method="post" class="regi_input">
    <input type="text" name="userName" placeholder="성명 입력"><br>
    <div class="box"><input type="email" name="userEmail" placeholder="이메일"><br>
    <label for="emailCheckbox" class="cGreen fw_600 fs_17">아이디 중복 확인<input type="checkbox" id="emailCheckbox" class="ml-2" /></label></div><br>
    <input type="password" name="userPassword" placeholder="비밀번호"><br><!--아이디 중복확인부분 글자색 굵기 크기 변경  -->

    <div class="file-input-wrapper">
        <input type="file" name="userImage" placeholder="사진" class="m-0"> <!-- 마진 0으로 -->
    </div><br>

    <input type="text" name="userPhoneNumber"  placeholder="휴대전화번호(Ex:010-1234-5678)"><br>
    <input type="submit" value="회원가입" class="btn_green2"><!-- 버튼클래스속성 추가 -->
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