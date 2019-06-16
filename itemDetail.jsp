<!DOCTYPE html>
<html lang="en">

<head>
    <%@page pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home</title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/component.css">
  <link rel="stylesheet" type="text/css" href="css/product.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
  integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <script src="./js/jquery-3.2.1.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <script src="./js/swiper.min.js"></script>
  <style>
    
  </style>
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
        String pagenum = request.getParameter("page");
        sql="use final";
        con.createStatement().execute(sql);
          sql="select * from final.product where productid ='"+pagenum+"'";
          ResultSet rs=con.createStatement().executeQuery(sql);
          while(rs.next()){
            out.println("<div class='row'>");
            out.println("<div style='width:80%;margin:0 auto;text-align:center;'>");
              out.println("<h1>"+rs.getString(2)+"套餐</h1>");
              out.println("<img style='width:30%' src='./img/"+rs.getString(5)+".jpg'>");
              out.println("<p>"+rs.getString(3)+"</p>");
            out.println("</div></div>");
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
<div class="col-xs-12">
  <h1 style="text-align: center">商品評論</h1>
    <div class="col-xs-4"></div>
      <div class="col-xs-4" >

        <textarea wrap="hard" readonly style="width:100%;height:300px;">
<%
            try{
  Class.forName("com.mysql.jdbc.Driver");
  
  try{
  int starsnum =0;
    String url="jdbc:mysql://127.0.0.1:3306/final?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String sql = "";
    Connection con = DriverManager.getConnection(url,"root","1234");
    if(con.isClosed())
      out.print("連線建立失敗");
    else
      {
        String pagenum = request.getParameter("page");
        sql="use final";
        con.createStatement().execute(sql);
          sql="select * from final.message where productid ='"+pagenum+"'";
          ResultSet rms2=con.createStatement().executeQuery(sql);
          while(rms2.next()){
            sql="select * from final.member where memberid = '"+rms2.getString(3)+"'";
            ResultSet rm2 = con.createStatement().executeQuery(sql);
            while(rm2.next()){
              out.println("會員名稱："+rm2.getString(2));
              out.println("留言："+rms2.getString(4));
              out.print("評分:");
              starsnum = Integer.parseInt(rms2.getString(6));
                for(int i =0;i<starsnum;i++){
                out.print("★");}
                for(int i =0;i<(5-starsnum);i++){
                out.print("☆");
              }
              out.println("");
              out.println("留言日期："+rms2.getString(5));
              out.println("---------------------------------------------------");
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
          %>
        </textarea>
        <h3>我要留言</h3>
        <%
          if(session.getAttribute("name")!=null){
            out.println("<form action='./jsp/add.jsp?page="+request.getParameter("page")+"' method='post'>");
            out.println("<textarea maxlength='30' name='message' wrap='hard' style='width:100%' cols='20'>請輸入留言</textarea>");

            %>
          
          <div class="star" align="left">
            <p>分數評分</p>
            <input type="radio" id="star5" name="star" value="5" CHECKED hidden />
            <label for="star5"><i class="fas fa-star"></i></label>
            <input type="radio" id="star4" name="star" value="4" hidden />
            <label for="star4"><i class="fas fa-star"></i></label>
            <input type="radio" id="star3" name="star" value="3" hidden />
            <label for="star3"><i class="fas fa-star"></i></label>
            <input type="radio" id="star2" name="star" value="2" hidden />
            <label for="star2"><i class="fas fa-star"></i></label>
            <input type="radio" id="star1" name="star" value="1" hidden />
            <label for="star1"><i class="fas fa-star"></i></label>
          </div>

          
            <%
            out.println("<input type='submit' value='送出留言'>");
            out.println("</form");
          }
          else{
            out.println("<div style='text-align:center'>");
            out.println("<a href='./login.jsp'>請先登入</a>");
            out.println("</div>");
          }
        %>
      </div>
</div>
 <!--  <div class="row">
    <div style="width:80%;margin:0 auto;text-align:center;">
      <h1>卡拉空氣套餐</h1>
      <img src="./img/item1.jpg">
      <p>鮮嫩多汁空氣口感，保證讓你口口空虛。</p>
    </div>
  </div> -->

</body>

</html>