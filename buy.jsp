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
          <!-- <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li>
                <a href="#">Action</a>
              </li>
              <li>
                <a href="#">Another action</a>
              </li>
              <li>
                <a href="#">Something else here</a>
              </li>
              <li role="separator" class="divider"></li>
              <li>
                <a href="#">Separated link</a>
              </li>
            </ul>
          </li> -->
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
  </nav>

  <!-- 內容 -->
  <div class="row">
    <div style="width:80%;margin: 0 auto;">
      <table class="table">
        <thead>
          <th>#</th>
          <th>項目</th>
          <th>價格</th>
          <th><th>
        </thead>
        <tbody>

          <%
          boolean buy_button = true;
  if(session.getAttribute("name")!=null){
    try{
      Class.forName("com.mysql.jdbc.Driver");
  
      try{
        int i = 0;
        int sum = 0;
        
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
              sql="select * from final.buy where memberid='"+rm.getString(1)+"'";
              ResultSet rb = con.createStatement().executeQuery(sql);
             if(rb.next()){
              buy_button = true;
              rb.previous();
               while(rb.next()){
               sql="select * from final.product where productid='"+rb.getString(3)+"'";
               ResultSet rp = con.createStatement().executeQuery(sql);
                while(rp.next()){
                 i++;
                 out.println("<tr>");
                 out.println("<td>"+i+"</td>");
                 out.println("<td>"+rp.getString(2)+"</td>");
                 out.println("<td>$"+rp.getString(6)+"</td>");
                 out.println("<td><input type='button' value='刪除' onclick=\"javascript:location.href='./jsp/delete_buy.jsp?buyid="+rb.getString(1)+"'\"></td>");
                 sum += Integer.valueOf(rp.getString(6)).intValue();
                }
               }
              out.println("</tbody>");
              out.println("<tfoot>");
              out.println("<tr><td>總計</td><td></td><td>$"+sum+"</td><td></td></tr>");

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
  else{
    response.sendRedirect("login.jsp");
}
out.println("</table>");
if(buy_button){
      out.println("<div class='btn btn-primary pull-right'>");
      out.println("<a style='color:white' href='./jsp/buy.jsp?member="+session.getAttribute("name")+"'>結帳");
      out.println("</a></div>");
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
      <%
      
      %>

    </div>
  </div>

</body>

</html>