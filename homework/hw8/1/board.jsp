<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<html>
<head>
<title>�d����</title>
</head>
<body>
<a href="view.jsp?page=1">�[�ݯd��</a><p>
<form name="form1" method="post" action="add.jsp">
�m�W�G<input type="text" name="name"><br>
�l��G<input type="text" name="mail"><br>
�D�D�G<input type="text" name="subject"><br>
���e�G<textarea rows=5 name="content"></textarea><br>
<input type="submit" name="Submit" value="�e�X">
<input type="Reset" name="Reset" value="���s��g">
</form>
</body>
</html>
