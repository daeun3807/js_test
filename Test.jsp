<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일전송 테스트페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
</head>
<style>
 	.chat_input {
		border:2px solid gray;
		width:330px;
		padding:13px;
		border-radius:10px;
	}
	
	#file {
		border:1px solid lightgray;
	}
</style>
<script type="text/javascript">
/****
* TO DO
* 다중파일 업로드
* 다운로드
* 확장명 체크
* 크기 체크
* 전송 전에 확인 팝업
* 프로그래스 바
****/
function fileCheck() {
	//파일 확장자 체크       
    var filePath      = document.fileUpform.fileName.value;
    var idx           = filePath.lastIndexOf(".")+1;  //확장자 제외한 경로+파일명
    var idx2          = filePath.lastIndexOf("\\")+1; //파일경로를 제외한 파일명+확장자
    var extension     = (filePath.substr(idx, filePath.length)).toLowerCase();  //확장자명
    var fileNameCheck = filePath.substring(idx2, filePath.length).toLowerCase(); //파일명.확장자
       
    if(fileNameCheck.length != 0) { //파일명+확장자 길이가 0이 아니라면(=파일이 선택되었다면)
        if( extension != 'gif' && extension != 'jpg' && extension != 'jpeg' && extension != 'png' && extension != 'bmp') {
			alert("이미지 파일만 전송 가능합니다.");		
			$("#file").val("");
            return false;   
            
        } else if(document.getElementById("submit").value != "") {
			//용량 체크
			var fileList = document.getElementById("file").files;
			var fileSize = document.getElementById("file").files[0].size;
			var maxSize = 1 * 1024 * 1024; //1MB
		
			for(var fileList = 0; fileList.length > 0; fileList++ ) {
		 
				if(fileSize > maxSize){
				    alert("이미지 파일은 1MB 이내로 전송이 가능합니다. ");
					$("#file").val("");
					return false;
					}			
			}		
		}
		
		var confirmResult = confirm("이 파일을 전송하시겠습니까?");
		if(confirmResult){
			document.fileUpform.submit();
			
		} else {			
			alert("파일 전송이 취소되었습니다.");
			$("#file").val("");
			return false;
		}	
	}
}
</script>
<body>
	<div class="chat_input">
		<form action="" name="fileUpform" method="post" enctype="multipart/form-data">
			<input type="file" name="fileName" id="file" multiple>
			<button id="submit" onclick="fileCheck()">전송</button>
		</form>
	</div>
</body>
</html>