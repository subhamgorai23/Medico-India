<%-- 
    Document   : addadminpage
    Created on : 10-Mar-2024, 8:15:02 pm
    Author     : subhamgorai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>new admin creation</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">NEW ADMIN CREATION PAGE</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="al" placeholder="Enter new Admin login id" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="ap" placeholder="Enter new Admin password" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Create"/>
                </td>
            </tr>
        </table>
    </form>
       <%
           String a=request.getParameter("al");
           String ps=request.getParameter("ap");
           try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
	String ins="insert into adminlog(aid,apass) values(?,?)";
        PreparedStatement p=con.prepareStatement(ins);
	p.setString(1,a);
	p.setString(2,ps);
        p.executeUpdate();
        out.println("one record inserted");
        p.close();
        con.close();
           }
           catch(Exception e)
           {}
           %>
    </body>
</html>
