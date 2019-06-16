<%@ page import = "java.sql.*, java.io.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>計數器</title>
</head>
<body>
<%
String thePath=request.getRealPath("/")+"2" ; 				
File count=new File(thePath,"count.txt");//要事先建立
BufferedReader count_in=new BufferedReader(new FileReader(count));//建立檔案輸入串流
//out.println(thePath);
//getRealPath表本網頁所在的根目錄

try {
    Class.forName("com.mysql.jdbc.Driver");
    try {
		String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
        Connection con=DriverManager.getConnection(url,"root","1234"); 
        String sql="";
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
           sql="use counter";
           con.createStatement().execute(sql);
           sql="select * from countable";
		   ResultSet rs=con.createStatement().executeQuery(sql);
		   
		   while(rs.next())
		   {
				//int x=count_in.read(); //使用read讀取檔案, 格式為ASCII
				int x=Integer.parseInt(count_in.readLine());//使用readLine讀取檔案, 格式為字串
				count_in.close();//關閉輸入串流

			   if(session.isNew())
			   {

				//計數器加1
				   x++;
					out.print("你是第"+x+"位訪客");
					FileWriter count_out=new FileWriter(count);
					count_out.write(String.valueOf(x));//將數字轉成字串,寫入輸出串流
					count_out.flush();//將buffer寫入
					count_out.close();//關閉串流
			   }
			   else
			   {
					out.print("你是第"+x+"位訪客");
			   }
			   sql="update countable set count=\'"+x+"\' ";
		   }
			
           con.createStatement().execute(sql);
           con.close();         
        }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
		   
%>
</body>
</html>
