
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String jwtToken=request.getHeader("Authorization");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<a href=home.jsp>home</a>
<a href=login.jsp>home2</a>
<input type="button" onclick="doDo()" value="logintest">
<a href="http://localhost:8080/auth/head">authhead</a>
<input type="button" onclick="dohead()" value="head">
<input type="button" onclick="getlocal()" value="local">

<script>
var params = new URLSearchParams(location.search);
var getType= params.get('token');
console.log(getType);
localStorage.setItem('Authorization', getType);	

var jwt;
var refresh;
function showhead(){
	console.log(jwt);
	console.log(refresh);
}
function getlocal(){
	jwt=localStorage.getItem('Authorization');
	console.log(jwt);
	 var xhr = new XMLHttpRequest();
	 xhr.open('POST', 'http://localhost:8080/auth/index2');
	 xhr.setRequestHeader('Authorization', jwt);
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.withCredentials = true;
	 xhr.send();
	 xhr.onload=function(){
	        if(xhr.status==200){
	        }
	    }
}
function goNaverLogin(){
    var xhr = new XMLHttpRequest(); //new로 생성
    xhr.open('POST', 'http://localhost:8080/auth/naver', true); //j쿼리 $ajax.({type,url},true가 비동기)
    xhr.send(); /// ajax data부분
    xhr.onload = function() { 
        if(xhr.status==200){
   
        }else{
            alert('통신에 실패했습니다');
        }
    }  
}
var data=JSON.stringify({"email":"kim@kim.com","pwd":"1111"});
function doDo(){
	 var xhr = new XMLHttpRequest();
	 xhr.open('POST', 'http://localhost:8080/login');
	 xhr.setRequestHeader("Content-Type",'application/json');
	 xhr.withCredentials = true;
	 xhr.send(data);
	 xhr.onload=function(){
	        if(xhr.status==200){
	            jwt=xhr.getResponseHeader('Authorization');
	            localStorage.setItem('Authorization', jwt);
	            window.location.href = 'http://localhost:9090/front/home.jsp';
	        }
	    }
}
function dohead(){
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://localhost:8080/auth/index'); 
    xhr.send(); /// ajax data부분
    xhr.onload=function(){
        location.href=xhr.response;
    }
}
</script>
</body>
</html>
