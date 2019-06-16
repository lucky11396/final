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
				String useremail = new String(request.getParameter("user-email").getBytes("ISO-8859-1"),"UTF-8");
				String useraddress = new String(request.getParameter("user-address").getBytes("ISO-8859-1"),"UTF-8");
				String userpass = request.getParameter("user-pass");
				String repeatpass = request.getParameter("user-repeatpass");
				if(useremail !=null){
					sql="update final.member set memberemail =";
					sql+="'"+useremail+"\'";
					sql+="where membername ='"+session.getAttribute("name")+"'";
					con.createStatement().execute(sql);
					out.println("電子郵件修改成功！<br>");
					out.println("新電子郵件:"+useremail+"<br>");
				}
				if(useraddress !=null){
					sql="update final.member set memberaddress =";
					sql+="'"+useraddress+"'";
					sql+="where membername ='"+session.getAttribute("name")+"'";
					con.createStatement().execute(sql);
					out.println("地址修改成功！<br>");
					out.println("新地址:"+useraddress+"<br>");
				}
				if(useremail !=null){
					if(userpass.equals(repeatpass)){
						sql="update final.member set memberpass =";
						sql+="'"+userpass+"'";
						sql+="where membername ='"+session.getAttribute("name")+"'";
						con.createStatement().execute(sql);
						out.println("密碼修改成功！<br>");
						out.println("新密碼:"+userpass+"<br>");
					}
					else{
						out.print("請確認重新輸入密碼正確");
					}
				}
				out.print("<a href='../user.jsp'>回會員中心</a>");
				
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