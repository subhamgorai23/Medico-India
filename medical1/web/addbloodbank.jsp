<%-- 
    Document   : addbloodbank
    Created on : 13-Mar-2024, 8:15:36 pm
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
        <h1 align="center">ADD NEW BLOOD-BANK</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="bn" placeholder="Enter BloodBank name" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="ba" placeholder="Enter BloodBank address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="bcn" placeholder="Enter BloodBank contact" required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="bm" placeholder="Enter BloodBank mailid " required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="bci" placeholder="Enter BloodBank city " required />
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
        String name=request.getParameter("bn");
        String address=request.getParameter("ba");
        String contact=request.getParameter("bcn");
        String mail=request.getParameter("bm");
        String city=request.getParameter("bci");
         try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
	String ins="insert into bloodbank(bname,baddress,bcontact,bmail,bcity) values(?,?,?,?,?)";
        PreparedStatement p=con.prepareStatement(ins);
        p.setString(1,name);
	p.setString(2,address);
        p.setString(3,contact);
        p.setString(4,mail);
        p.setString(5,city);
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
