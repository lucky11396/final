<!DOCTYPE html>
<html lang="en">

<head>
    <%@page pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home</title>
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/swiper.min.css">
  <script src="./js/jquery-3.2.1.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <script src="./js/swiper.min.js"></script>
<%
    int buy_count = 0;
          if (session.getAttribute("name")!=null){
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
        sql="select * from final.member where membername='"+session.getAttribute("name")+"'";
        ResultSet rm = con.createStatement().executeQuery(sql);
        while(rm.next()){
          sql="select * from final.buy where memberid = '"+rm.getString(1)+"'";
          ResultSet rb = con.createStatement().executeQuery(sql);
          while(rb.next()){
            buy_count++;
          }
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
  %>
</head>

<body style="overflow-x:hidden;overflow-y:auto;">
  <!-- 上面的BAR -->
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <!-- 改成你要的名子(或專案名稱) -->
        <a class="navbar-brand" href="./index.jsp">飛食福</a>
      </div>

      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <!-- 連結項目I -->
          <li>
            <a href="./items.jsp">商品</a>
          </li>
          <!-- 連結項目II -->
          <li>
            <a href="./buy.jsp">購買<%out.print("("+buy_count+")");%></a>
          </li>
          <!-- 連結項目III -->
          <li>
            <a href="./user.jsp">會員中心</a>
          </li>
          <!-- 連結項目IV -->
          <li>
            <a href="./about.jsp">關於</a>
          </li>
          <%
          String adm = "1";
          if (session.getAttribute("name")!=null){
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
        sql="select * from final.member where membername='"+session.getAttribute("name")+"'";
        ResultSet rm = con.createStatement().executeQuery(sql);
        while(rm.next()){
          if(rm.getString(7).equals(adm)){
            out.println("<li>");
            out.println("<a href='./manager.jsp'>管理頁面</a>");
            out.println("</li>");
          }
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
          %>
        </ul>
        <!-- 右邊的連結項目 -->
        <ul class="nav navbar-nav navbar-right">
          
          <li>
            <%
              if(session.getAttribute("name") != null)
                out.print("<a href='user.jsp'>"+session.getAttribute("name")+"</a>");
              else
                out.print("<a href='login.jsp'>Login</a>");
                
            %>
          </li>
          <li>
            <%
              if(session.getAttribute("name") != null)
                out.print("<a href='jsp/logout.jsp'>Log out</a>");
              else
                out.print("<a href='register.jsp'>Register</a>");
                
            %>
          </li>
          <!-- 下拉式選單 有需要再開起註解 -->
        </ul>
      </div>
    </div>
  </nav>

  <!-- 內容 -->
  <div class="row">
    <div style="width:500px;margin:0 auto;">
      <div>
        <table class="table">
          <tbody>

            <%
  if(session.getAttribute("name")!=null){
    try{
      Class.forName("com.mysql.jdbc.Driver");
  
      try{
        int buy_sum = 0;
        String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String sql = "";
        Connection con = DriverManager.getConnection(url,"root","1234");
          if(con.isClosed())
            out.print("連線建立失敗");
          else
          {
            sql="use final";
            con.createStatement().execute(sql);
            sql="select * from final.member where membername ='"+session.getAttribute("name")+"'";
            ResultSet rm = con.createStatement().executeQuery(sql);
            while(rm.next()){
              sql="select * from final.orders where memberid ='"+rm.getString(1)+"'";
              ResultSet ro = con.createStatement().executeQuery(sql);
              while(ro.next()){
                buy_sum++;
              }
              out.println("<tr><td>帳號申請日期</td>");
              out.println("<td>"+rm.getString(6)+"</td></tr>");
              out.println("<tr><td>購買次數</td>");
              out.println("<td>"+buy_sum+"</td></tr>");
              out.println("<tr><td>信箱</td>");
              out.println("<td>"+rm.getString(4)+"</td></tr>");
              out.println("<tr><td></td>");
              out.println("<td style='text-align:right'><a href='update.jsp'>修改資料</a></td></tr>");
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
    response.sendRedirect("./login.jsp");
}
  %>
  <table class="table">
        <thead>
          <th>#</th>
          <th>項目</th>
          <th>日期</th>
        </thead>
        <tbody>

          <%
  if(session.getAttribute("name")!=null){
    try{
      Class.forName("com.mysql.jdbc.Driver");
  
      try{
        int i = 0;
        int sum = 0;
        boolean buy_button;
        String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
        String sql = "";
        Connection con = DriverManager.getConnection(url,"root","1234");
          if(con.isClosed())
            out.print("連線建立失敗");
          else
          {
            sql="use final";
            con.createStatement().execute(sql);
            sql="select * from final.member where membername ='"+session.getAttribute("name")+"'";
            ResultSet rm = con.createStatement().executeQuery(sql);
            while(rm.next()){
              sql="select * from final.orders where memberid='"+rm.getString(1)+"'";
              ResultSet ro = con.createStatement().executeQuery(sql);
             if(ro.next()){
              buy_button = true;
              ro.previous();
               while(ro.next()){
               sql="select * from final.product where productid='"+ro.getString(3)+"'";
               ResultSet rp = con.createStatement().executeQuery(sql);
                while(rp.next()){
                 i++;
                 out.println("<tr>");
                 out.println("<td>"+i+"</td>");
                 out.println("<td>"+rp.getString(2)+"</td>");
                 out.println("<td>$"+ro.getString(4)+"</td>");
                 sum += Integer.valueOf(rp.getString(6)).intValue();
                }
               }
              out.println("</tbody>");
              out.println("<tfoot>");

              }
              else{
                out.println("<tr><td>無商品<td><tr>");
                out.println("</tbody>");
                buy_button = false;
             }
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

  %>

          <!-- 
          添加項目直接加一組
          <tr>
            <td>1</td>
            <td>卡拉牛套餐</td>
            <td>87$</td>
          </tr>
        -->

<!--         <tfoot>
          <tr>
            <td>Sum</td>
            <td></td>
            <td>957$</td>
          </tr>
        </tfoot> -->
      </table>
            <!-- <tr>
              <td>帳號申請日期</td>
              <td>2019/05/26</td>
            </tr>
            <tr>
              <td>購買次數</td>
              <td>87</td>
            </tr>
            <tr>
              <td>信箱</td>
              <td>APPLE@GMAIL.COM</td>
            </tr> -->
          </tbody>
        </table>
      </div>
    </div>
  </div>

</body>

</html>