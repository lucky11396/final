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
		String onoff;
		String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		String sql = "";
		Connection con = DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.print("連線建立失敗");
		else
			{
				sql="use final";
           		con.createStatement().execute(sql);
				sql="select * from final.product";
				ResultSet rp = con.createStatement().executeQuery(sql);
				while(rp.next()){
					String addstock = request.getParameter(rp.getString(1));
					int addnum = Integer.valueOf(addstock).intValue();
					int oldstock = Integer.valueOf(rp.getString(4)).intValue();
					sql="update product set stock ='"+(addnum+oldstock)+"'where productid = '"+rp.getString(1)+"'";
					con.createStatement().execute(sql);
					String onoff1 = "onoff"+rp.getString(1);
					String onoff2 = request.getParameter(onoff1);
					if(onoff2.equals("1")){
						sql="update product set onsale='1' where productid='"+rp.getString(1)+"'";
					}
					else{
						sql="update product set onsale='0' where productid='"+rp.getString(1)+"'";
					}
					con.createStatement().execute(sql);
				}
				response.sendRedirect("../manager.jsp");
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