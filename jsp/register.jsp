<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.*"%>
	<%@page pageEncoding="UTF-8"%>
	<%	
try{
	Class.forName("com.mysql.jdbc.Driver");
	
	try{
		boolean ins = true;
		String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		String sql = "";
		Connection con = DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.print("連線建立失敗");
		else
			{
				sql="use final";
           		con.createStatement().execute(sql);
				String username = new String(request.getParameter("user-name").getBytes("ISO-8859-1"),"UTF-8");
				String useremail = new String(request.getParameter("user-email").getBytes("ISO-8859-1"),"UTF-8");
				String userpass = request.getParameter("user-pass");
				String repeatpass = request.getParameter("user-repeatpass");
				String useraddress = new String(request.getParameter("user-address").getBytes("ISO-8859-1"),"UTF-8");
				java.util.Date date = new java.util.Date();
				sql = "select * from final.member where memberemail ='"+useremail+"'";
				ResultSet rs = con.createStatement().executeQuery(sql);
				if(username!=null&&useremail!=null&&userpass!=null){
						if(userpass.equals(repeatpass)){
							while(rs.next()){
								if(rs.getString(4).equals(useremail)){
								ins = false;
								}

							}
							if(ins){
							sql="insert member (membername, memberpass, memberemail, memberaddress,regdate,adm) ";
							sql+="values (";
							sql+="'"+username+"',";
							sql+="'"+userpass+"',";
							sql+="'"+useremail+"\',";
							sql+="'"+useraddress+"',";
							sql+="'"+date+"',";
							sql+="'0'";
							sql+=");";
							con.createStatement().execute(sql);
							out.print("註冊成功<br>");
							out.print("<a href='../index.jsp'>回首頁</a>");
							}
							else{
							out.print("此電子郵件已被註冊<br>");
							out.print("<a href='../register.jsp'>回首頁</a>");
						}
						}
						else{
						out.print("重複輸入密碼錯誤<br>");
						out.print("<a href='../register.jsp'>回上一頁</a>");
						}
				}
				else{
				out.print("請輸入帳號密碼<br>");
				out.print("<a href='../register.jsp'>回上一頁</a>");
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
	<%

	%>
</body>
</html>