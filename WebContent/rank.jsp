<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Entity.rank" %>
<%@ page import="dao.rankDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Rank</title>
</head>
<body>
 
	<%
	String name = new String(request.getParameter("name"));
    int second = new Integer(request.getParameter("second"));
    String difficulty = new String(request.getParameter("difficulty"));
	
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/sodoku?serverTimezone=UTC";
	String usename = "root";
	String psw= "123456";  
    Connection conn = DriverManager.getConnection(url,usename,psw);
    System.out.println(name+second+difficulty);
    PreparedStatement tmt = conn.prepareStatement("Insert into rank(name,second,difficulty) values('"+name+"','"+second+"','"+difficulty+"')");       
    int rst = tmt.executeUpdate();  
    if (rst != 0){  
          out.println("<script language='javascript'>alert('Successfult！');window.location.href='sodoku.jsp';</script>");    
    }
    else{  
          out.println("<script language='javascript'>alert('Failure！');window.location.href='sodoku.jsp';</script>");    
    }  
	%>
 
 
</body>
</html>
