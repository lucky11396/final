<%@page pageEncoding='utf-8'%>
<%@page import='java.sql.*'%>
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
            sql="insert final.product(productname,introduction,stock,pic,price,onsale,sold)values(";
            sql+="'','','0','','0','0',0)";
            con.createStatement().execute(sql);
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