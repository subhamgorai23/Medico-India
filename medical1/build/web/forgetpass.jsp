<%-- 
    Document   : forgetpass
    Created on : 01-May-2024, 8:06:19 pm
    Author     : subhamgorai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Forget Password</title>
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
            height: 100vh;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.8); /* Transparent white */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 66.67%; /* Two-thirds of the original size */
            max-width: 400px; /* Maximum width to ensure it doesn't get too large on big screens */
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
                <img src="logo.jpeg" alt="Logo">
            </div>
            <div class="website-name">Medico India</div>
            <div class="tagline">your life is our priority</div>
        </div>
        <div class="buttons">
            <div class="oval-button">Contact Us</div>
            <div class="oval-button">Review</div>
        </div>
    </div>
    <div class="login-container">
        <div class="login-box">
            <h1>FORGET PASSWORD</h1>
            <%
                String email = request.getParameter("em");
                String secQ = null;
                String secA = request.getParameter("securityAnswer");
                String newPassword = request.getParameter("newPassword");
                String confirmNewPassword = request.getParameter("confirmNewPassword");
                boolean validEmail = false;
                boolean validAnswer = false;

                // Check if email is provided and no other inputs are given
                if (email != null && secA == null && newPassword == null && confirmNewPassword == null) {
                    try {
                         Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
                        String query = "SELECT squestion FROM registration WHERE email=?";
                        PreparedStatement stmt = con.prepareStatement(query);
                        stmt.setString(1, email);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next()) {
                            secQ = rs.getString("squestion");
                            validEmail = true;
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                // Check if email and security answer are provided
                if (email != null && secA != null && newPassword == null && confirmNewPassword == null) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
                        String query = "SELECT sanswer FROM registration WHERE email=? AND sanswer=?";
                        PreparedStatement stmt = con.prepareStatement(query);
                        stmt.setString(1, email);
                        stmt.setString(2, secA);
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next()) {
                            validAnswer = true;
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                // Check if all inputs are provided for changing the password
                if (email != null && secA != null && newPassword != null && confirmNewPassword != null) {
                    if (newPassword.equals(confirmNewPassword)) {
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");
                            String update = "UPDATE registration SET password=? WHERE email=?";
                            PreparedStatement stmt = con.prepareStatement(update);
                            stmt.setString(1, newPassword);
                            stmt.setString(2, email);
                            stmt.executeUpdate();
                            stmt.close();
                            con.close();
                            response.sendRedirect("login.jsp");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else {
                        out.println("<script>alert('Passwords do not match!');</script>");
                    }
                }
            %>

            <% if (email == null) { %>
                <!-- Show email input form -->
                <form method="post">
                    <input type="text" name="em" placeholder="Enter your email id" required />
                    <input type="submit" value="SUBMIT" />
                </form>
            <% } else if (validEmail && secQ != null && secA == null) { %>
                <!-- Show security question form -->
                <form method="post">
                    <input type="hidden" name="em" value="<%= email %>" />
                    <label for="securityQuestion"><%= secQ %></label>
                    <input type="text" name="securityAnswer" placeholder="Enter your security answer" required />
                    <input type="submit" value="SUBMIT" />
                </form>
            <% } else if (validAnswer && newPassword == null && confirmNewPassword == null) { %>
                <!-- Show new password form -->
                <form method="post">
                    <input type="hidden" name="em" value="<%= email %>" />
                    <input type="hidden" name="securityAnswer" value="<%= secA %>" />
                    <input type="password" name="newPassword" placeholder="Enter new password" required />
                    <input type="password" name="confirmNewPassword" placeholder="Re-enter new password" required />
                    <input type="submit" value="CHANGE PASSWORD" />
                </form>
            <% } %>
        </div>
    </div>
</body>
</html>