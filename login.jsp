<!DOCTYPE html>
<html lang="en">

<head>
    <%@page pageEncoding="UTF-8"%>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login</title>
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
            <a href="./items.jsp">商品</a>
          </li>
          <!-- 連結項目II -->
          <li>
            <a href="./buy.jsp">購買</a>
          </li>
          <!-- 連結項目III -->
          <li>
            <a href="./user.jsp">會員中心</a>
          </li>
          <!-- 連結項目IV -->
          <li>
            <a href="./about.jsp">關於</a>
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
        </ul>
      </div>
    </div>
  </nav>

  <div class="row" style="text-align:center;">
    <div id="logreg-forms" style="max-width:500px;margin:0 auto;">
      <h1>Login</h1>
<form action="jsp/logincheck.jsp" method="post">
      <input class="form-control" type="email" name="inputEmail" id="inputEmail" placeholder="Email address" autofocus>
      <input class="form-control" type="password" name="inputPassword" id="inputPassword" placeholder="Password">

      <input type="submit" value="Login" class="btn btn-success btn-block">
    </form>
    </div>
  </div>

  <script>

  </script>

</body>

</html>