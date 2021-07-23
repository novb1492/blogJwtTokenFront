
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<a href=home.jsp>home</a>
<input type="button"onclick="goNaverLogin()"value="naverlogin">
<script>

function goNaverLogin(){
    var xhr = new XMLHttpRequest(); //new로 생성
    xhr.open('POST', 'http://localhost:8080/auth/naver', true); //j쿼리 $ajax.({type,url},true가 비동기)
    xhr.send(); /// ajax data부분
    xhr.onload = function() { 
        if(xhr.status==200){
        	location.href=xhr.response;
        }else{
            alert('통신에 실패했습니다');
        }
    }  
}

</script>
</body>
</html>
