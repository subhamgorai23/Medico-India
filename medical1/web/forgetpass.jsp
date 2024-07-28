<%-- 
    Document   : forgetpass
    Created on : 01-May-2024, 8:06:19 pm
    Author     : subhamgorai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="forgetpass_style.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    </head>
    <body>
        <div class="container">
            <header>
            <div class="nav">
                    <ul class="navItems">
                        <li class="navLogo">
                                 <img src="mlogo.png" alt="no" class="img">
                        </li>
                        <li class="navHeading">
                            <div class="navText">
                                <h1 id="heading">Medical World</h1>
                                <p id="tagLine">~We are here for your happiness</p>
                            </div>
                            <div class="navtag">
                                <a href="#">Home</a>
                                <a href="#">About</a>
                                <a href="#">Contact us</a>
                            </div>
                        </li>
                        <li class="idk"></li>
                    </ul>
            </div>
            </header>
<main>
    <div class="content">
        <div class="box">
            <form method="post">
                <h2 id="headLine">Login</h2>
                <br></br>
                <div><label for="em"><b>Enter your Email id</b></label>
                    <input type="text" name="em" required></div>
                 <div><label for="ps"><b>Enter new Password</b></label>
                    <input type="password"name="pass" required></div>
                <div><label for="cps"><b>Confirm Password</b></label>
                    <input type="password"name="newpass" required></div>
                    <div><input type="submit" value="change"></div>
            </form>
            <%
            String mail=request.getParameter("em");
            String pas=request.getParameter("pass");
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","subham23");	
           String ins="update registration set passoword=? where email=?";
           PreparedStatement p=con.prepareStatement(ins);
           p.setString(1,pas);
           p.setString(2,mail);
           int r=p.executeUpdate();
           if(r>0)
           {
           response.sendRedirect("login.jsp");
            }
        }
        catch(Exception e)
        {}
            %>
        </div>
    </div>
</main>
    <footer>
         <div class="footerbox"><!--
            <div class="wrapper">
                <div class="button">
                    <div class="icon">
                        <i class="fa-brands fa-facebook-f"></i>
                    </div>
                </div>
                <div class="button">
                    <div class="icon">
                        <i class="fa-brands fa-instagram"></i>
                    </div>
                </div>
                <div class="button">
                    <div class="icon">
                        <i class="fa-brands fa-twitter"></i>
                    </div>
                </div>
                <div class="button">
                    <div class="icon">
                        <i class="fa-brands fa-youtube"></i>
                    </div>
                </div>
            </div> -->
            <div class="footerLine">
                 <p> Copyright &copy; Medical World pvt ltd. All rights reserved 2024</p>
            </div>
        </div>
    </footer>
    </div>
        
   </body>
</<html>