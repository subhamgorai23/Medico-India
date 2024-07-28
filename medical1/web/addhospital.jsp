<%-- 
    Document   : addhospital
    Created on : 11-Mar-2024, 8:28:21 pm
    Author     : subhamgorai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>hospital add</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">ADD NEW HOSPITAL</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="hn" placeholder="Enter Hospital name" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="ha" placeholder="Enter Hospital address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="hci" placeholder="Enter Hospital city" required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="hcn" placeholder="Enter Hospital contact " required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="hm" placeholder="Enter Hospital mailid " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Add"/>
                </td>
            </tr>
        </table>
    </form>
        <%
        String name=request.getParameter("hn");
        String address=request.getParameter("ha");
        String city=request.getParameter("hci");
        String contact=request.getParameter("hcn");
        String mail=request.getParameter("hm");
         try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
	String ins="insert into hospital(hname,haddress,hcity,hcontact,hmail) values(?,?,?,?,?)";
        PreparedStatement p=con.prepareStatement(ins);
        p.setString(1,name);
	p.setString(2,address);
        p.setString(3,city);
        p.setString(4,contact);
        p.setString(5,mail);
        p.executeUpdate();
        out.println("Record added!");
        p.close();
        con.close();
        } 
        catch(Exception e)
           {}
        %>
    </body>
</html>