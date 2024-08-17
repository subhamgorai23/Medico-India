<%-- 
    Document   : registration
    Created on : 27-Mar-2024, 8:45:10 pm
    Author     : subhamgorai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration</title>
    <style>
        body {
            background-image: url("medical.jpeg"); /* Ensure this path is correct */
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: rgba(0, 123, 255, 0.7); /* Transparent blue */
            color: #333;
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

        .registration-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .registration-box {
            background: rgba(255, 255, 255, 0.8); /* Transparent white */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 66.67%; /* Two-thirds of the original size */
            max-width: 500px; /* Maximum width to ensure it doesn't get too large on big screens */
        }

        .registration-box h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .registration-box input[type="text"],
        .registration-box input[type="password"],
        .registration-box input[type="email"],
        .registration-box input[type="tel"] {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .registration-box input[type="submit"] {
            width: calc(100% - 20px); /* Full width minus padding */
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .registration-box input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.3);
        }
        .show-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
    </style>
    <script>
        function togglePasswordVisibility() {
            var passwordField = document.getElementById("password");
            var icon = document.getElementById("showPasswordIcon");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.src = "eye-slash-icon.png"; // Change to hide icon
            } else {
                passwordField.type = "password";
                icon.src = "eye-icon.png"; // Change to show icon
            }
        }
    </script>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <div class="logo">
                <img src="mlogo.png" alt="Logo">
            </div>
            <div class="website-name">Medico India</div>
            <div class="tagline">your life is our priority</div>
        </div>
        <div class="buttons">
            <div class="oval-button"><a href="login.jsp">Login</a></div>
            <div class="oval-button"><a href="registration.jsp">Register</a></div>
        </div>
    </div>
    <div class="registration-container">
        <div class="registration-box">
            <h1>USER REGISTRATION</h1>
            <form method="post">
                <input type="email" name="um" placeholder="Enter your email" required />
                <input type="text" name="un" placeholder="Name" required />
                <input type="text" name="ua" placeholder="Full address" required />
                <input type="text" name="uc" placeholder="Corresponding city" required />
                <input type="text" name="ucn" placeholder="Contact no." required />
                <div style="position: relative;">
                <input type="password" id="password" name="up" placeholder="Password" required />
                <img src="eye-icon.png" class="show-password" id="showPasswordIcon" onclick="togglePasswordVisibility()" />
            </div><br>
                <input type="password" name="cpw" placeholder="Reenter password" requirer />
                <select name="securityQuestion1" required>
                    <option value="">Select a security question</option>
                    <option value="What is your mother's maiden name?">What is your mother's maiden name?</option>
                    <option value="What was the name of your first pet?">What was the name of your first pet?</option>
                    <option value="What was the name of your first school?">What was the name of your first school?</option>
                </select>
                <input type="text" name="securityAnswer1" placeholder="Answer" required />

                <input type="submit" value="Sign up" />
            </form>
        <%
        String mailid=request.getParameter("um");
        String name=request.getParameter("un");
        String address=request.getParameter("ua");
        String city=request.getParameter("uc");
        String contactno=request.getParameter("ucn");
        String password=request.getParameter("up");
         String securityQuestion1 = request.getParameter("securityQuestion1");
            String securityAnswer1 = request.getParameter("securityAnswer1");
         try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
	String ins="insert into registration(email,name,address,city,contact,password,squestion,sanswer) values(?,?,?,?,?,?,?,?)";
        PreparedStatement p=con.prepareStatement(ins);
        p.setString(1,mailid);
	p.setString(2,name);
        p.setString(3,address);
        p.setString(4,city);
        long cno=Long.parseLong(contactno);
        p.setLong(5,cno);
        p.setString(6,password);
        p.setString(7,securityQuestion1);
                p.setString(8,securityAnswer1);
                int r=p.executeUpdate();
                if(r>0)
                {
                response.sendRedirect("login.jsp");
                }
                p.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
   </body>
</html>
