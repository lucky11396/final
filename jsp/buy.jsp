<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<%@page pageEncoding="utf-8"%>
	<%@page import="java.util.*"%>
	<%@page import="java.sql.*"%>
</head>
<body>
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
      	java.util.Date date = new java.util.Date();
        sql="use final";
        con.createStatement().execute(sql);
        sql="select * from final.member where membername ='"+session.getAttribute("name")+"'";
        ResultSet rm=con.createStatement().executeQuery(sql);
          while(rm.next()){
          	sql="select * from final.buy where memberid='"+rm.getString(1)+"'";
          	ResultSet rb = con.createStatement().executeQuery(sql);
          	while(rb.next()){
          		sql="select * from final.product where productid='"+rb.getString(3)+"'";
          		ResultSet rp = con.createStatement().executeQuery(sql);
          		while(rp.next()){
          			int newstock = Integer.valueOf(rp.getString(4)).intValue();
          			newstock--;
                int newsold = Integer.valueOf(rp.getString(8)).intValue();
                newsold++;
					sql="update final.product set stock=";
          sql+="'"+newstock+"'";
          sql+="where productid ='"+rp.getString(1)+"'";
          con.createStatement().execute(sql);
          sql="update final.product set sold=";
          sql+="'"+newsold+"'";
          sql+="where productid ='"+rp.getString(1)+"'";
          con.createStatement().execute(sql);
          		}
				sql="insert into final.orders(memberid,productid,orderdate) values(";
				sql+="'"+rb.getString(2)+"',";
				sql+="'"+rb.getString(3)+"',";
				sql+="'"+date+"')";
				con.createStatement().execute(sql);
				
          	}
          	sql="delete from final.buy where ";
			sql+="memberid = '"+rm.getString(1)+"'";
			con.createStatement().execute(sql);
			response.sendRedirect("../user.jsp");
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
</body>
</html>