<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkRegister</title>
</head>
<body>
 
<%
String user = new String(request.getParameter("username"));
    String pwd = new String(request.getParameter("password"));
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/sodoku?serverTimezone=UTC";
	String usename = "root";
	String psw= "123456";  
    Connection conn = DriverManager.getConnection(url,usename,psw);
    
    PreparedStatement pStmt = conn.prepareStatement("select * from user where username = '" + user + "'");  
    ResultSet rs = pStmt.executeQuery();  			
	if(rs.next()){  
         out.println("<script language='javascript'>alert('The username has existed!)window.location.href='register.jsp';</script>");  
    }
	else{  
          PreparedStatement tmt = conn.prepareStatement("Insert into user(username,password) values('" + user + "','" + pwd + "')");   
          int rst = tmt.executeUpdate();  
          if (rst != 0){  
                out.println("<script language='javascript'>alert('Succssful！');window.location.href='login.jsp';</script>");    
          }
          else{  
                out.println("<script language='javascript'>alert('failure！');window.location.href='register.jsp';</script>");    
          }  
      }	
	%>
 
 
</body>
</html>
