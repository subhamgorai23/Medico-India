<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
     <style>
       body {
            background-image: url("medical.jpeg");
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color:dimgray; /* Transparent blue */
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
         .webnamne{
            display:flex;
            justify-content: space-between;
            flex-direction:column;
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
            padding: 15px;
            margin:10px 0;
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
    <div class="login-container">
        <div class="login-box">
            <h1>LOGIN PAGE</h1>
            <form method="post">
                <input type="text" name="em" placeholder="Enter your email id" required />
                <input type="password" name="ps" placeholder="Enter your password" required />
                <input type="submit" value="LOGIN" />
                <div class="login-links">
                    <a href="registration.jsp">New User?</a>
                    <a href="#">Forget Password?</a>
                </div>
            </form>
  
        <%
            String mail=request.getParameter("em");
            String pass=request.getParameter("ps");
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
           String ins="select * from registration where email=? and password=?";
           PreparedStatement p=con.prepareStatement(ins);
           p.setString(1,mail);
           p.setString(2,pass);
           ResultSet r;
           r=p.executeQuery();
           if(r.next())
           {
           response.sendRedirect("explore.jsp");
        }
        r.close();
        p.close();
        con.close();
        }
        catch(Exception e)
        {}
            %>
        </div>
    </div>
    </body>
</html>
