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
        <title>Medicine Shop add</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">ADD NEW MEDICINE SHOP</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="msn" placeholder="Enter MedicineShop name" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="msa" placeholder="Enter address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="msci" placeholder="Enter city" required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="mscn" placeholder="Enter contact no. " required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="msd" placeholder="Enter opening days " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="msh" placeholder="Enter opening hours " required />
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
        String name=request.getParameter("msn");
        String address=request.getParameter("msa");
        String city=request.getParameter("msci");
        String contact=request.getParameter("mscn");
        String days=request.getParameter("msd");
        String hours=request.getParameter("msh");
         try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
	String ins="insert into medicineshop(shopName,shopAddress,shopCity,shopContact,shopDays,shopHour) values(?,?,?,?,?,?)";
        PreparedStatement p=con.prepareStatement(ins);
        p.setString(1,name);
	p.setString(2,address);
        p.setString(3,city);
        p.setString(4,contact);
        p.setString(5,days);
        p.setString(6,hours);
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
