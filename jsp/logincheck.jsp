<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%@page import="java.sql.*"%>
	<%@page pageEncoding="UTF-8"%>
	<%	
try{
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		String sql = "";
		Connection con = DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.print("連線建立失敗");
		else
			{
				sql="use final";
           		con.createStatement().execute(sql);
				String useremail = new String(request.getParameter("inputEmail").getBytes("ISO-8859-1"),"UTF-8");
				String userpass = request.getParameter("inputPassword");

				if(useremail!=null&&userpass!=null){
					sql="select * from final.member where memberemail ='"+useremail+"\'";
					ResultSet rs=con.createStatement().executeQuery(sql);
					if(rs.next()){
						if(userpass.equals(rs.getString(3)))
						{
							out.print("登入成功<br>");
							out.print("<a href='../index.jsp'>回首頁</a>");
							session.setAttribute("name",rs.getString(2));
						}
						else{
							out.print("請確認您的帳號密碼正確");
							out.print("<a href='../index.jsp'>回首頁</a>");
						}
					}
					else{
						out.print("請確認您的帳號密碼正確");
						out.print("<a href='../index.jsp'>回首頁</a>");
					}
				}
				else{
					out.print("請輸入帳號密碼");
					out.print("<a href='../index.jsp'>回首頁</a>");
					

				}
			}
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
</head>
<body>
</body>
</html>