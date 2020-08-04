<%@ page import="java.sql.*" %>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>CheckLogin</title>
</head>
<body>
 
<%
	String username=new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
	String password=new String(request.getParameter("password").getBytes("ISO-8859-1"),"utf-8");

	String driverName="com.mysql.jdbc.Driver";
	String userName="root";
	String psw="123456";
	String dbName="sodoku";
	String tableName="user";
	
	String url="jdbc:mysql://127.0.0.1:3306/sodoku?serverTimezone=UTC";
	Class.forName("com.mysql.jdbc.Driver");
	out.println("tag 1");
	Connection conn=DriverManager.getConnection(url,userName,psw); ;
	
	if(conn!=null){
		
		String sql="select * from user where username='"+username+"' and password='"+ password + "'";
		out.println("sql="+sql);
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
			session.setAttribute("username", username);
			out.println("<script language='javascript'>alert('Successful！')；</script>");
			response.sendRedirect("sodoku.jsp");
			//window.location.href='sodoku.jsp';
		}
		else{
			 out.println("<script language='javascript'>alert('Failure！');window.location.href='login.jsp';</script>");
			 //response.sendRedirect("login.jsp");
		}
	}
	else{
		out.println("<script language='javascript'>alert('Connection is failure！');</script>");
		response.sendRedirect("login.jsp");
	}
 
%>
 
</body>
</html>
