<%@page pageEncoding='utf-8'%>
<%@page import='java.sql.*'%>

<%
      String new_name = "";
      String new_introduction = "";
      String new_pic = "";
      String new_price = "";

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
            sql="select * from final.product";
            ResultSet rp = con.createStatement().executeQuery(sql);
            while(rp.next()){
              new_name = new String(request.getParameter("newname"+rp.getString(1)).getBytes("ISO-8859-1"),"UTF-8");
              new_introduction = new String(request.getParameter("newintroduction"+rp.getString(1)).getBytes("ISO-8859-1"),"UTF-8");
              new_pic = new String(request.getParameter("newpic"+rp.getString(1)).getBytes("ISO-8859-1"),"UTF-8");
              new_price = new String(request.getParameter("newprice"+rp.getString(1)).getBytes("ISO-8859-1"),"UTF-8");
              sql="update product set productname ='"+new_name+"'where productid='"+rp.getString(1)+"'";
              con.createStatement().execute(sql);
              sql="update product set introduction ='"+new_introduction+"'where productid='"+rp.getString(1)+"'";
              con.createStatement().execute(sql);
              sql="update product set pic ='"+new_pic+"'where productid='"+rp.getString(1)+"'";
              con.createStatement().execute(sql);
              sql="update product set price ='"+new_price+"'where productid='"+rp.getString(1)+"'";
              con.createStatement().execute(sql);

            }
            response.sendRedirect("../manageproduct.jsp");
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