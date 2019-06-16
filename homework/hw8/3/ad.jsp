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
		String url="jdbc:mysql://localhost/";
		String sql = "";
		Connection con = DriverManager.getConnection(url,"root","asdf1234");
		if(con.isClosed())
			out.print("連線建立失敗");
		else
			{
				sql="use ad";
           		con.createStatement().execute(sql);
           		Random ran = new Random();
				int current_adid = ran.nextInt(3)+1;
           		sql="select * from ad where ADid = " + current_adid;
				ResultSet rs=con.createStatement().executeQuery(sql);
				while(rs.next())
				{
					out.print("<a href='http://"+rs.getString(4)+"'>");
					out.print("<img src='"rs.getString(2)+"/"+rs.getString(3)+"'");
					out.print("alt='"+rs.getString(5)+"'></a>");
					int count = Integer.parseInt(rs.getString(7));
					count++;
					sql="update AD set count = '"+count+"'where ADid='"+ current_adid+"'";
					con.createStatement().execute(sql);
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