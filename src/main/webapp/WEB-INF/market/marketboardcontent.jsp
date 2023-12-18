<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
$(function(){
    list();
    
    $("#btnansweradd").click(function(){
        let msg = $("#answermsg").val();
        let boardSeq = $("#boardSeq").val(); // Retrieve boardSeq value from the hidden input
        
        if(msg.length == 0){
            alert("댓글 내용을 입력하세요");
            return;
        }
        
        $.ajax({
            type: "post",
            dataType: "text",
            url: "../answer/insert",
            data: {"boardSeq": boardSeq, "msg": msg},
            success: function(res){
                list();
                $("#answermsg").val("");
            }
        });
    });

    function list() {
        let boardSeq = $("#boardSeq").val(); // Retrieve boardSeq value from the hidden input

        $.ajax({
            type: "get",
            dataType: "json",
            url: "../answer/list",
            data: {"boardSeq": boardSeq},
            success: function(res){
                $("#answercount").text("댓글 " + res.length);

                let s = "";
                $.each(res, function(idx, item){
                    s +=
                        "<span style='margin-left:20px;'>" + item.commentContent + "</span>" +
                        "&nbsp;" +
                        "<span style='color:gray;font-size:0.9em;'>" + item.createDate + "</span>";
                    s += "<br>";  
                });
                $("div.answerlist").html(s);
            }
        });
    }

    // Rest of your JavaScript code...
});


</script>
</head>
<body>

<div>
	<div>

			<div id="answercount">댓글 0</div>
			<div class="answerlist" style="margin-left:10px;">
				댓글목록 나올곳
			</div>
	
			<div class="answerform input-group">
				<input type="text" class="form-control" style="width:300px;" placeholder="댓글내용"
				id="answermsg">
				<button type="button" class="btn-sm btn btn-outline-success" id="btnansweradd">저장</button>	
			</div>
		
			<button type="button" class="btn btn-outline-secondary btn-sm"
			style="width:80px;"
			onclick="history.back()">목록</button>
	
		
	</div> 
	<div id="answerend"></div>
	
</div>
</body>