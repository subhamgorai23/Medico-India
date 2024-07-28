<%-- 
    Document   : doctot
    Created on : 19-Jul-2024, 8:55:28 pm
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
        <h1 align="center">ADD NEW DOCTOR</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="dn" placeholder="Enter doctor name" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="da" placeholder="Enter doctor address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dc" placeholder="Enter doctor city " required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="dchm" placeholder="Enter doctor chamber " required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="dspcl" placeholder="Enter specializaton " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="ddeg" placeholder="Enter doctor degree " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dcn" placeholder="Enter doctor contact " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dm" placeholder="Enter doctor mail " required />
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
            String name=request.getParameter("dn");
            String addr=request.getParameter("da");
            String city=request.getParameter("dc");
            String cham=request.getParameter("dchm");
            String spec=request.getParameter("dspcl");
            String degr=request.getParameter("ddeg");
            String dcnt=request.getParameter("dcn");
            String mail=request.getParameter("dm");
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "subham23");
            String ins="insert into doctor(dname,daddr,dcity,dchamber,dspecialization,ddgree,dcontact,dmail) values(?,?,?,?,?,?,?,?)";
            PreparedStatement p=con.prepareStatement(ins);
            p.setString(1,name);
            p.setString(2,addr);
            p.setString(3,city);
            p.setString(4,cham);
            p.setString(5,spec);
            p.setString(6,degr);
            long cont=Long.parseLong(dcnt);
            p.setLong(7,cont);
            p.setString(8,mail);
            int r=p.executeUpdate();
            if(r>0)
            out.println("one record inserted");
        }
        catch(Exception e)
        {}
            %>
    </body>
</html>
