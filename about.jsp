<!DOCTYPE html>
<html lang="en">

<head>
    <%@page pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>關於</title>
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
      </div>
    </div>
  </nav>

  <!-- 內容 -->
  <div class="row">
    <div style="width:50%;margin:0 auto;font-size:20px;">

      <table class="table">
        <tbody>
          <tr>
            <td>組別</td>
            <td>29++</td>
          </tr>
          <tr>
            <td rowspan="4">組員</td>
            <td>10444118 黃鈺程</td>
          </tr>
          <tr>
            <td>10444152 蕭世傑</td>
          </tr>
          <tr>
            <td>10644135 林奕霖</td>
          </tr>
          <tr>
            <td>10644151 黃靖沅</td>
          </tr>

          <tr>
            <td rowspan="4">工作分配</td>
            <td>黃鈺程：網頁版面(50%)</td>
          </tr>
          <tr>
            <td>蕭世傑：書面文件報告(50%)</td>
          </tr>
          <tr>
            <td>林奕霖：(50%)</td>
          </tr>
          <tr>
            <td>黃靖沅：(50%)</td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>

</body>

</html>