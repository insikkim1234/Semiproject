<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
        } /* 백그라운드색 변경 보더변경 */
        .file-input-wrapper input[type=file] {
            width: calc(100% - 22px);
            box-sizing: border-box;
            margin-top: 5px;
            display: table;
            margin-left: auto;
            margin-right: auto;
        }

        .regi_input>input[type=text], .regi_input>input[type=password],
        .regi_input>input[type=submit], .regi_input>.box,
        .regi_input>.box2 {
            width: 350px;
            padding: 10px;
            /* border-radius: 10px; */
            margin-bottom: 10px;
            display: table;
            margin-left: auto;
            margin-right: auto;
            border: 0;
            border-bottom: 2px solid #11B560;
            background-color: transparent;
        } /* 보더변경하고 색상변경 */
        .box {
            display: table;
            margin-left: auto;
            margin-right: auto;
        }
        .box2 {
            display: table;
            margin-left: auto;
            margin-right: auto;
        }

        /*밑에 두 속성 추가  */
        .regi_input>input[type=submit] {
            background-color: #11B560;
            border: 2px solid #0E942C;
            border-radius: 10px;
        }
        .regi_input>input[type=submit]:hover {
            background-color: #EBEE48;
            border: 2px solid #E1A900;
        }
        
        .box>input[type=email],
        .box2>input[type=text]{
        	border:0;
        }
    </style>
</head>
<body>
<div class="fw_500 cBlack mt-5 mx-auto" style="width: 350px">
	<a href="${pageContext.request.contextPath}">HOME</a><span class="fs_18 mx-1">></span>
	<a href="${pageContext.request.contextPath}/member/register">회원가입</a>
</div>
<div class="fs_40 text-center cGreen fw_600 mt-3 mb-5">JOIN US</div>
<form action="/semi/member/register" method="post" class="regi_input mt-3" enctype="multipart/form-data" onsubmit="return validatePasswords()">

    <div class="box d-flex justify-content-between">
        <input type="email" name="userEmail" placeholder="이메일주소(필수)" id="userEmail" required><br>
            <label class="cGreen fw_600 fs_17 mb-0">중복 확인<input type="checkbox" id="emailCheckbox" class="ml-2" required>
        </label>
    </div>
	
    <input type="password" name="userPassword" id="password1" placeholder="비밀번호(필수)" required class="mt-4">
    <input type="password" name="confirmPassword" placeholder="비밀번호 확인(필수)" required><br>

    <div class="box2 d-flex justify-content-between">
        <input type="text" name="userNickName" placeholder="닉네임(필수)" id="userNickName" required><br>
            <label class="cGreen fw_600 fs_17 mb-0">중복 확인<input type="checkbox" id="nicknameCheckbox" class="ml-2" required>
        </label>
    </div>

    <input type="text" name="userName" placeholder="이름(필수)" required class="mt-4"><br>

    <input type="text" name="userPhoneNumber"
           placeholder="휴대폰번호(ex:010-1234-5678)" class="mt-3" required><br>

    <div id="root">
        <div class="contents">
            <div class="upload-box">
                <label class="file-label fw_600" for="chooseFile">프로필 등록</label>
                <input class="file" id="chooseFile" type="file" name="uploadFile"
                       accept="image/png, image/jpeg, image/gif">
            </div>
        </div>
    </div><br>
    <input type="submit" value="회원가입" class="btn_green2" ><br><br>
    </form>
    <script>
        // 중복 체크 후 변경 시 체크 해제
        $("#userEmail").on("propertychange change keyup paste input", function(){
            $('#emailCheckbox').prop('checked', false);
        });

        $('#emailCheckbox').on("click",function (){
            // 체크 해제할 때 검증 불필요
            if (!$('#emailCheckbox').is(":checked")) return;

            const userEmail =$('#userEmail').val();
            var jsonObj = JSON.stringify({"userEmail" : userEmail});
            $.ajax({
                url : "./duplicatedEmailCheck",
                type :"post",
                dataType : "json",
                data : jsonObj,
                contentType:"application/json",

                // success 와 complete 에서의 response가 다름. 200, 500 모두 success 상황에서 나누고 있기 때문에 여기서 처리
                success :function (response){
                    alert(response.message);
                    if (response.status === "200") {
                        $('#emailCheckbox').prop('checked',true);
                    } else {
                        $('#emailCheckbox').prop('checked', false);
                    }
                },
                error : function(error){
                    console.error(error);
                    // 방어 코드
                    alert("네트워크 에러");
                    $('#emailCheckbox').prop('checked', false);
                },
            })
        })

        // 닉네임 중복 체크 후 변경 시 체크 해제
        $("#userNickName").on("propertychange change keyup paste input", function(){
            $('#nicknameCheckbox').prop('checked', false);
        });

        $('#nicknameCheckbox').on("click",function (){
            // 체크 해제할 때 검증 불필요
            if (!$('#nicknameCheckbox').is(":checked")) return;

            const userNickName =$('#userNickName').val();
            var jsonObj = JSON.stringify({"userNickName" : userNickName});
            $.ajax({
                url : "./duplicatedNickNameCheck",
                type :"post",
                dataType : "json",
                data : jsonObj,
                contentType:"application/json",

                // success 와 complete 에서의 response가 다름. 200, 500 모두 success 상황에서 나누고 있기 때문에 여기서 처리
                success :function (response){
                    alert(response.message);
                    if (response.status === "200") {
                        $('#nicknameCheckbox').prop('checked',true);
                    } else {
                        $('#nicknameCheckbox').prop('checked', false);
                    }
                },
                error : function(error){
                    console.error(error);
                    // 방어 코드
                    alert("네트워크 에러");
                    $('#nicknameCheckbox').prop('checked', false);
                },
            })
        })

        // 메시지 출력 함수
        function showAlert(message) {
            alert(message);
        }

        // 비밀번호가 일치하지 않을 때만 에러 메시지
        function validatePasswords() {
            let password = document.getElementsByName("userPassword")[0].value; // 비밀번호 필드의 값
            let confirmPassword = document.getElementsByName("confirmPassword")[0].value; // 비밀번호 확인 필드의 값

            if (password !== confirmPassword) {
                showAlert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }

    </script>
    </body>
</html>
