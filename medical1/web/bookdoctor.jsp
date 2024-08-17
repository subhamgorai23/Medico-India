<%-- 
    Document   : bookdoctor
    Created on : 12-Aug-2024, 8:33:24 pm
    Author     : subhamgorai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booking Doctor</title>
    <style>
        body {
            background-image: medical.jpeg;
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: rgba(0, 123, 255, 0.7); /* Transparent blue */
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
        }

        .website-name {
            font-weight: bold;
            font-size: 24px;
            margin-left: 10px;
        }

        .tagline {
            font-size: 14px;
            margin-left: 10px;
        }

        .logo img {
            width: 50px;
            height: auto;
        }

        .buttons {
            display: flex;
        }

        .oval-button {
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            margin-left: 10px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .oval-button a {
            color: #fff;
            text-decoration: none;
        }

        .oval-button:hover {
            background-color: #0056b3;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 20px;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.8); /* Transparent white */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 66.67%; /* Two-thirds of the original size */
            max-width: 600px; /* Maximum width to ensure it doesn't get too large on big screens */
            margin-bottom: 20px; /* Added margin to separate from results */
        }

        .login-box h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-box input[type="submit"] {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .login-box input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .login-links {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .login-links a {
            color: #007bff;
            text-decoration: none;
        }

        .login-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <div class="logo">
                <img src="mlogo.jpg" alt="Logo">
            </div>
            <div class="website-name">Medico India</div>
            <div class="tagline">your life is our priority</div>
        </div>
        <div class="buttons">
            <div class="oval-button"><a href="contactus.jsp">Contact Us</a></div>
            <div class="oval-button"><a href="review.jsp">Review</a></div>
        </div>
    </div>
    <div class="login-container">
        <div class="login-box">
            <h1>BOOKING DOCTOR</h1>
            <form method="post" action="bookdoctor.jsp">
                <h3>Patient Information:</h3>
                <input type="text" name="bpn" placeholder="Enter Patient Name" value="<%= request.getParameter("bpn") != null ? request.getParameter("bpn") : "" %>" required />
                <input type="text" name="bps" placeholder="Sex" value="<%= request.getParameter("bps") != null ? request.getParameter("bps") : "" %>" required />
                <input type="text" name="bpa" placeholder="Age" value="<%= request.getParameter("bpa") != null ? request.getParameter("bpa") : "" %>" required />
                <input type="text" name="bpc" placeholder="Contact No." value="<%= request.getParameter("bpc") != null ? request.getParameter("bpc") : "" %>" required />
                <input type="text" name="dname" value="<%= request.getParameter("dname") %>" readonly />
                <input type="text" name="dspecialization" value="<%= request.getParameter("dspecialization") %>" readonly />
                <input type="submit" value="Book" />
            </form>
                <%
                    String pname=request.getParameter("bpn");
                    String psex=request.getParameter("bps");
                    String age=request.getParameter("bpa");
                    String cont=request.getParameter("bpc");
                    String doc=request.getParameter("dname");
                    String spec=request.getParameter("dspecialization");
                    try
                    {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "subham23");
                    String ins="insert into bookdoctor(bpname,bpage,bpsex,bpcontact,bdoctor,bspecialization)values(?,?,?,?,?,?)";
                    PreparedStatement p=con.prepareStatement(ins);
            p.setString(1,pname);
            p.setString(2,psex);
            long pg=Long.parseLong(age);
            p.setLong(3,pg);
            long cnt=Long.parseLong(cont);
            p.setLong(4,cnt);
            p.setString(5,doc);
            p.setString(6,spec);
            int r=p.executeUpdate();
            if(r>0)
            out.println("one record inserted");
        }
        catch(Exception e)
        {}
            %>
        </div>
    </div>
</body>
</html>
