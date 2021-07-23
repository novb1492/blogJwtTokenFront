
<%@page import="java.net.CookieHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<input type="button" onclick="getlocal()" value="local">
<script>
var jwt;
var refresh;
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
</script>
</body>
</html>
