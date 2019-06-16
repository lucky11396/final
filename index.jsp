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
  int counter = 0;
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
        sql="select * from final.counter";
        ResultSet rc = con.createStatement().executeQuery(sql);
        while(rc.next()){
            counter = Integer.valueOf(rc.getString(2)).intValue();
            if(session.getAttribute("counted")!=null){

            }
            else{
            counter++;
            sql="update final.counter set counter ='"+counter+"' where counterid = '1'";
            con.createStatement().execute(sql);
            session.setAttribute("counted","true");
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
            <a>
            訪客數:<%out.print(counter);%>
            
          </a>
          </li>
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
    <!-- 內容左半部 -->
    <!-- <div class="col-xs-3">
      <div style="text-align: center;font-size: 30px;margin: 0 0 15px 0;">
        <span>Item I</span>
      </div>
      <div style="text-align: center;font-size: 30px;margin: 0 0 15px 0;">
        <span>Item II</span>
      </div>
      <div style="text-align: center;font-size: 30px;margin: 0 0 15px 0;">
        <span>Item III</span>
      </div>
    </div> -->
    <!-- 內容右半部 -->
    <div class="col-xs-1"></div>
    <div class="col-xs-10">
      <!-- swiper 可滑動的那塊 -->
      <div class="swiper-container" style="text-align:center;">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="./img/bigmac.png" alt="item1">
          </div>
          <div class="swiper-slide">
            <img src="./img/spicy.png" alt="item2">
          </div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
      </div>

      <!-- 下面小圖 -->
      <div class="row" style="text-align:center;">
        <h1>熱銷商品</h1>
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
        sql="select * from final.product order by sold DESC";
        ResultSet rp = con.createStatement().executeQuery(sql);
        for(int i=0;i<4;i++){
          rp.next();
          out.println("<div class='col-xs-3'>");
          out.println("<img src='./img/"+rp.getString(5)+".jpg' alt='item1' style='width:100%'>");
          out.println("<span class='item_name'>"+rp.getString(2)+"套餐 已售出:"+rp.getString(8)+"</span>");
          out.println("<p class='item_describe'>"+rp.getString(3)+"</p>");
          out.println("</div>");
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
        <!-- <div class="col-xs-3">
          <img src="./img/item1.jpg" alt="item1" style="width:100%">
          <span class="item_name">套餐A</span>
          <p class="item_describe">濃郁醬汁滿足你的胃口</p>
        </div>
        <div class="col-xs-3">
          <img src="./img/item2.jpg" alt="item2" style="width:100%">
          <span class="item_name">套餐B</span>
          <p class="item_describe">酥脆炸雞讓你絕不停手</p>
        </div>
        <div class="col-xs-3">
          <img src="./img/item1.jpg" alt="item1" style="width:100%">
          <span class="item_name">套餐C</span>
          <p class="item_describe">獨特麻辣讓你大呼過癮</p>
        </div>
        <div class="col-xs-3">
          <img src="./img/item2.jpg" alt="item2" style="width:100%">
          <span class="item_name">套餐D</span>
          <p class="item_describe">沒有特色</p>
        </div>
      </div> -->
    </div>
  </div>

  <script>
    // SWIPER 初始化
    // 可參考: https://idangero.us/swiper/demos/
    const swiper = new Swiper('.swiper-container', {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });



  </script>

</body>

</html>