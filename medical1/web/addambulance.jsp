<%-- 
    Document   : addambulance
    Created on : 31-Jul-2024, 12:01:10 pm
    Author     : subhamgorai
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add ambulance</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">ADD AMBULANCE SERVICE</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="an" placeholder="Enter Ambulance name" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="aa" placeholder="Enter Ambulance address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="acn" placeholder="Enter Ambulance contact" required />
                </td>
            </tr>
             <tr>
                <td>
                   
                    <input type="text" name="aci" placeholder="Enter Ambulance city " required />
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
        String name=request.getParameter("an");
        String address=request.getParameter("aa");
        String contact=request.getParameter("acn");
        String city=request.getParameter("aci");
         try {
          Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");		
	String ins="insert into ambulance(name,address,contact,city) values(?,?,?,?)";
        PreparedStatement p=con.prepareStatement(ins);
        p.setString(1,name);
	p.setString(2,address);
        p.setString(3,contact);
        p.setString(4,city);
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
