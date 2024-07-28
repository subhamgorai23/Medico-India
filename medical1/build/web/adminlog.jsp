<%-- 
    Document   : adminlog
    Created on : 08-Mar-2024, 8:24:01 pm
    Author     : subhamgorai
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="green">
<form method="post">
<h1 align="center">ADMINISTRATION LOGIN PAGE</h1>
<table align="center">
<tr>
<td>
<input type="text" name="li" placeholder="Enter Admin login id" required />
</td>
</tr>
<tr>
<td>
<input type="password" name="ap" placeholder="Enter Admin password" required />
</td>
</tr>
<tr>
<td>
<input type="submit" value="LOGIN" />
</td>
</tr>
</table>
</form>
<%
String lg=request.getParameter("li");
String ps=request.getParameter("ap");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
	String ins="select * from adminlog where aid=? and apass=?";
	PreparedStatement p=con.prepareStatement(ins);
	p.setString(1,lg);
	p.setString(2,ps);
	ResultSet r=p.executeQuery();
	if(r.next())
	{
		response.sendRedirect("admin.jsp");
	}
r.close();
p.close();
con.close();
       }catch(Exception e)
{
}%>
</body>
</html>
