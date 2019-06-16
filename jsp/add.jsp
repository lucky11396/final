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
		String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		String sql = "";
		Connection con = DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.print("連線建立失敗");
		else
			{
				sql="use final";
           		con.createStatement().execute(sql);
				String addmessage = new String(request.getParameter("message").getBytes("ISO-8859-1"),"UTF-8");
				String pageid = request.getParameter("page");
				String stars = request.getParameter("star");
				java.util.Date date = new java.util.Date();
				if(request.getParameter("message") !=null && request.getParameter("message")!=""){
				sql = "select * from final.member where membername ='"+session.getAttribute("name")+"'";
				ResultSet rm = con.createStatement().executeQuery(sql);
				while(rm.next()){
					sql = "insert into message(productid,memberid,message,messagedate,stars) values(";
					sql+="'"+pageid+"',";
					sql+="'"+rm.getString(1)+"',";
					sql+="'"+addmessage+"',";
					sql+="'"+date+"',";
					sql+="'"+stars+"')";
					con.createStatement().execute(sql);
					
				}
				response.sendRedirect("../itemDetail.jsp?page="+pageid);
				}
				else{
				response.sendRedirect("../itemDetail.jsp?page="+pageid);
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