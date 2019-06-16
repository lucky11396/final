
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%@page import="java.sql.*"%>
	<%@page pageEncoding="UTF-8"%>
</head>
<body>
	<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.print("連線建立失敗");
		else
			out.print("連線成功");
	con.close();
		}
	catch (SQLException sExec){
	out.print("SQL錯誤！"+sExec.toString());
	}
}
catch (ClassNotFoundException err){
	out.print("class錯誤"+err.toString());
}
%>
</body>
</html>
