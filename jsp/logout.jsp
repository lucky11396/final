<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%@page pageEncoding="UTF-8"%>
</head>
<body>
	<%
		session.removeAttribute("name");
		out.print("登出成功<br>");
		out.print("<a href='../index.jsp'>回首頁</a>");
	%>
</body>
</html>