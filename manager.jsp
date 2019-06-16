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
            <a href="manager.jsp">庫存管理</a>
          </li>
          <li>
            <a href="manageproduct.jsp">商品管理</a>
          </li>
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
<div class="col-xs-2"></div>
<div class="col-xs-8">
  <form action="./jsp/prodchange.jsp" method="post">
  <table class="table">
    <thead>
      <th>商品編號</th>
      <th>商品名稱</th>
      <th>庫存</th>
      <th>新增庫存</th>
      <th></th>
    </thead>
    <tbody>
      <%
      String onsale = "1";
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
              out.println("<tr><td>"+rp.getString(1)+"</td>");
              out.println("<td>"+rp.getString(2)+"</td>");
              out.println("<td>"+rp.getString(4)+"</td>");
              out.println("<td><input type='text' name='"+rp.getString(1)+"' value='0' size='3'></td>");
              if(rp.getString(7).equals(onsale)){
                out.println("<td><input type='radio' name='onoff"+rp.getString(1)+"' value='1' checked>上架");
                out.println("<input type='radio' name='onoff"+rp.getString(1)+"' value='0'>下架</td>");
               }
              else{
                out.println("<td><input type='radio' name='onoff"+rp.getString(1)+"' value='1'>上架");
                out.println("<input type='radio' name='onoff"+rp.getString(1)+"' value='0' checked>下架</td>");
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
    </tbody>
      <tfoot>
        <tr><td colspan="4"></td><td><input type="submit" name="submit" value="修改"></td></tr>
      
      </tfoot>
  </table>
</form>
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