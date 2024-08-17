<%-- 
    Document   : addpathology
    Created on : 03-Aug-2024, 7:48:07 pm
    Author     : subhamgorai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Pathology</title>
</head>
<body>
    <form method="post">
        <h1 align="center">ADD PATHOLOGY</h1>
        <table align="center">
            <tr>
                <td><input type="text" name="pn" placeholder="ENTER PATHOLOGY NAME" required /></td>
            </tr>
            <tr>
                <td><input type="text" name="pa" placeholder="ENTER PATHOLOGY ADDRESS" required /></td>
            </tr>
            <tr>
                <td><input type="text" name="pcn" placeholder="ENTER PATHOLOGY CITY" required /></td>
            </tr>
            <tr>
                <td><input type="text" name="pc" placeholder="ENTER PATHOLOGY CONTACT" required /></td>
            </tr>
            <tr>
                <td><input type="text" name="pm" placeholder="ENTER PATHOLOGY MAIL" required /></td>
            </tr>
            <tr>
                <td><input type="text" name="pt" placeholder="ENTER PATHOLOGY TEST" required /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Add"/></td>
            </tr>
        </table>
    </form>
    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String name = request.getParameter("pn");
            String addr = request.getParameter("pa");
            String city = request.getParameter("pcn");
            String contact = request.getParameter("pc");
            String mail = request.getParameter("pm");
            String test = request.getParameter("pt");

            Connection con = null;
            PreparedStatement p = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "subham23");
                String ins = "insert into pathology(pname, paddr, pcity, pcontact, pmail, ptest) values(?,?,?,?,?,?)";
                p = con.prepareStatement(ins);
                p.setString(1, name);
                p.setString(2, addr);
                p.setString(3, city);
                long cont = Long.parseLong(contact);
                p.setLong(4, cont);
                p.setString(5, mail);
                p.setString(6, test);

                int r = p.executeUpdate();
                if (r > 0) {
                    out.println("One record inserted");
                }
            } catch (ClassNotFoundException | SQLException e) {
                out.println("Error: " + e.getMessage());
            } finally {
                try {
                    if (p != null) {
                        p.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    out.println("Error closing resources: " + e.getMessage());
                }
            }
        }
    %>
</body>
</html>