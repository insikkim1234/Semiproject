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
	.regi_input>input[type=submit], .regi_input>.box>input[type=email] {
	width: 300px;
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

/*밑에 두 속성 추가  */
.regi_input>input[type=submit] {
	background-color: #11B560;
	border: 2px solid #0e942c;
}

.regi_input>input[type=submit]:hover {
	background-color: #EBEE48;
	border: 2px solid #e1a900;
}
</style>
</head>
<body style="background-color: #eeefc7b8;">
	<div class="fs_40 text-center cGreen fw_600 mt-5">JOIN US</div>
	<form action="/semi/member/register" method="post"
		class="regi_input mt-3">
		<input type="text" name="userName" placeholder="성명 입력"><br>
		<div class="box">
			<input type="email" name="userEmail" placeholder="이메일"><br>
			<label for="emailCheckbox" class="cGreen fw_600 fs_17">아이디 중복
				확인<input type="checkbox" id="emailCheckbox" class="ml-2" />
			</label>
		</div>
		<br> <input type="password" name="userPassword"
			placeholder="비밀번호"><br>
		<!--아이디 중복확인부분 글자색 굵기 크기 변경  -->

		<!--  <div class="file-input-wrapper">
        <input type="file" name="userImage" placeholder="사진" class="m-0"> 마진 0으로
    </div><br> -->

		<div id="root">
			<h2 class="cGreen fs_17 fw_600 ">프로필 등록</h2>
			<div class="contents">
				<div class="upload-box">
					<div id="drop-file" class="drag-file">
						<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png"
							alt="파일 아이콘" class="image">
						<p class="message">Drag files to upload</p>
						<img src="" alt="미리보기 이미지" class="preview">
					</div>
					<label class="file-label fw_600" for="chooseFile">이미지 선택</label> 
					<input class="file" id="chooseFile" type="file" name="userPassword"
						onchange="dropFile.handleFiles(this.files)"
						accept="image/png, image/jpeg, image/gif">
				</div>
			</div>
		</div>

		<input type="text" name="userPhoneNumber"
			placeholder="휴대전화번호(Ex:010-1234-5678)" class="mt-3"><br>
		<input type="submit" value="회원가입" class="btn_green2">
		<!-- 버튼클래스속성 추가 -->
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
    
    
    function DropFile(dropAreaId, fileListId) {
    	  let dropArea = document.getElementById(dropAreaId);
    	  let fileList = document.getElementById(fileListId);

    	  function preventDefaults(e) {
    	    e.preventDefault();
    	    e.stopPropagation();
    	  }

    	  function highlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.add("highlight");
    	  }

    	  function unhighlight(e) {
    	    preventDefaults(e);
    	    dropArea.classList.remove("highlight");
    	  }

    	  function handleDrop(e) {
    	    unhighlight(e);
    	    let dt = e.dataTransfer;
    	    let files = dt.files;

    	    handleFiles(files);

    	    const fileList = document.getElementById(fileListId);
    	    if (fileList) {
    	      fileList.scrollTo({ top: fileList.scrollHeight });
    	    }
    	  }

    	  function handleFiles(files) {
    	    files = [...files];
    	    // files.forEach(uploadFile);
    	    files.forEach(previewFile);
    	  }

    	  function previewFile(file) {
    	    console.log(file);
    	    renderFile(file);
    	  }

    	  function renderFile(file) {
    	    let reader = new FileReader();
    	    reader.readAsDataURL(file);
    	    reader.onloadend = function () {
    	      let img = dropArea.getElementsByClassName("preview")[0];
    	      img.src = reader.result;
    	      img.style.display = "block";
    	    };
    	  }

    	  dropArea.addEventListener("dragenter", highlight, false);
    	  dropArea.addEventListener("dragover", highlight, false);
    	  dropArea.addEventListener("dragleave", unhighlight, false);
    	  dropArea.addEventListener("drop", handleDrop, false);

    	  return {
    	    handleFiles
    	  };
    	}

    	const dropFile = new DropFile("drop-file", "files");
</script>
</body>
</html>