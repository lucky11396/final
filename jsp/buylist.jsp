<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%@page import="java.sql.*"%>
	<%@page import="java.util.*"%>
	<%@page pageEncoding="UTF-8"%>
</head>
<body>
	<%
	if(session.getAttribute("name")!=null){
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
						String productnum = request.getParameter("product");
						sql="use final";
          		 		con.createStatement().execute(sql);
          		 		sql="select * from final.product where productid = '"+productnum+"'";
          		 		ResultSet rp = con.createStatement().executeQuery(sql);
          		 		sql="select * from final.member where membername='"+session.getAttribute("name")+"'";
          		 		ResultSet rm = con.createStatement().executeQuery(sql);
          		 		while(rp.next()&&rm.next()){
          		 			sql="insert into final.buy(memberid,productid) values(";
          		 			sql+="'"+rm.getString(1)+"',";
          		 			sql+="'"+rp.getString(1)+"')";
          		 			con.createStatement().execute(sql);
          		 			response.sendRedirect("../items.jsp");
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
	}
	else{
		response.sendRedirect("../login.jsp");
}
	%>
</body>
</html>