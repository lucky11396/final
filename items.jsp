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
    <!-- 內容 -->
    <div class="col-xs-1"></div>
    <div class="col-xs-10">
      <!-- 下面小圖 -->
      <div class="row" style="text-align:center;">
        <!--test-->
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
        int i =0;
        sql="use final";
        con.createStatement().execute(sql);
          sql="select * from final.product where onsale ='1'";
          ResultSet rs=con.createStatement().executeQuery(sql);
          while(rs.next()){
          i++;
          out.println("<div class='col-xs-4' style='margin-bottom:15px;'>");
          out.println("<a href='./itemDetail.jsp?page="+rs.getString(1)+"'>");
          out.println("<img src='./img/"+rs.getString(5)+".jpg' alt='"+rs.getString(2)+"' style='width:80%;position:relative; left:-10%'>");
          out.println("</a>");
          out.println("<div class='col-xs-2'></div>");
          out.println("<span class='item_name'>"+rs.getString(2)+"套餐$"+rs.getString(6)+"</span>");
          out.println("<p class='item_describe'>"+rs.getString(3)+"</p>");
          out.println("<div>");
          out.println("<div class='btn btn-primary'><a style='color:white' href='./jsp/buylist.jsp?product="+rs.getString(1)+"'>加入購物車</a></div>");
          out.println("<div class='btn btn-primary'><a style='color:white' href='./itemDetail.jsp?page="+rs.getString(1)+"'>商品介紹</a></div>庫存："+rs.getString(4));
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
        <!---->
         <!-- <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div> -->


        <!--<div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div>
        <div class="col-xs-4" style="margin-bottom:15px;">
          <a href="./itemDetail.jsp">
            <img src="./img/item1.jpg" alt="item1" style="width:100%">
          </a>
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
          <div>
            <div class="btn btn-primary">加入購物車</div>
            <div class="btn btn-primary">直接購買</div>
          </div>
        </div> -->

      </div>
    </div>
  </div>

  <script>

  </script>

</body>

</html>