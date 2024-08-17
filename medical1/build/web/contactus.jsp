<%-- 
    Document   : contactus
    Created on : 05-Aug-2024, 12:25:44 pm
    Author     : subhamgorai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact Us - Medico India</title>
    <style>
        body {
            background-image: url("medical.jpeg");
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
        h1{
            color:darkslategray;
        }

        .oval-button {
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            margin-left: 10px;
            background-color:cornflowerblue;
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
            height: calc(100vh - 50px); /* Adjusted height */
            margin-top: 0px; /* Smaller gap */
            flex-direction: column; /* Adjusted to allow stacking of login box and results */
        }

        .login-box {
            background: rgba(255, 255, 255, 0.5); /* Transparent white */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 66.67%; /* Two-thirds of the original size */
            max-width: 400px; /* Maximum width to ensure it doesn't get too large on big screens */
            margin-bottom: 20px; /* Added margin to separate from results */
        }

        .login-box h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-box input[type="text"],
        .login-box textarea {
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
    </style>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <div class="logo">
                <img src="mlogo.jpg" alt="Logo">
            </div>
            <div>
                <div class="website-name">Medico India</div>
                <div class="tagline">your life is our priority</div>
            </div>
        </div>
        <div class="buttons">
            <button class="oval-button"><a href="index.html">Back</a></button>
        </div>
    </div>
    <div class="login-container">
        <div class="login-box">
            <h1>CONTACT US</h1>
            <form method="post">
                <input type="text" name="cn" placeholder="ENTER NAME" required />
                <input type="text" name="cno" placeholder="ENTER PHONE NO." required />
                <input type="text" name="cma" placeholder="ENTER MAIL" required />
                <textarea name="cm" rows="6" cols="40" placeholder="ENTER MESSAGE (up to 255 characters)" maxlength="255" required></textarea>
                <input type="submit" value="Add"/>
            </form>
            <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
                    String mail = request.getParameter("cma");
                    String message = request.getParameter("cm");

                    Connection con = null;
                    PreparedStatement p = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "subham23");
                        String ins = "insert into contactus(cmail, cmessage) values(?, ?)";
                        p = con.prepareStatement(ins);
                        p.setString(1, mail);
                        p.setString(2, message);

                        int r = p.executeUpdate();
                        if (r > 0) {
                            out.println("<div class='result'>One record inserted</div>");
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        out.println("<div class='result'>Error: " + e.getMessage() + "</div>");
                    } finally {
                        try {
                            if (p != null) {
                                p.close();
                            }
                            if (con != null) {
                                con.close();
                            }
                        } catch (SQLException e) {
                            out.println("<div class='result'>Error closing resources: " + e.getMessage() + "</div>");
                        }
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
