<%-- 
    Document   : review
    Created on : 05-Aug-2024, 11:28:26 am
    Author     : subhamgorai
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Star Rating Review</title>
    <style>
        body {
            background-image: url("review.jpeg");
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
         h1{
            color:darkslategray;
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
        .login-box input[type="email"],
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
        .rating {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }
        .rating label {
            cursor: pointer;
            color: #777;
        }
        .rating input[type="radio"] {
            display: none; /* Hide the radio buttons */
        }
        .rating label:hover,
        .rating label:hover ~ label {
            color: #ffa500; /* Highlight stars on hover */
        }
        .rating input[type="radio"]:checked ~ label {
            color: #ffa500; /* Highlight selected stars */
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
            <button class="oval-button"><a href="contactus.jsp">Contact Us</a></button>
            <button class="oval-button"><a href="index.html">Back</a></button>
        </div>
    </div>
    <div class="login-container">
        <div class="login-box">
            
            <h1>WE APPRECIATE YOUR REVIEW</h1>
            <form method="post">
                <input type="email" name="email" placeholder="ENTER EMAIL" required />
                <div class="rating">
                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5">★</label>
                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4">★</label>
                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3">★</label>
                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2">★</label>
                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1">★</label>
                </div>
                     <input type="submit" value="Add"/>
            </form>
            <%
                String email = request.getParameter("email");
                String ratingStr = request.getParameter("rating");

                if (email != null && ratingStr != null) {
                    try {
                        int rating = Integer.parseInt(ratingStr);

                        // JDBC driver and database credentials
                        String jdbcUrl = "jdbc:mysql://localhost:3306/medical";
                        String dbUser = "root";
                        String dbPassword = "subham23";

                        // Database connection and insert query
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                        String insertQuery = "INSERT INTO review (rmail, rrating) VALUES (?, ?)";
                        PreparedStatement pstmt = conn.prepareStatement(insertQuery);
                        pstmt.setString(1, email);
                        pstmt.setInt(2, rating);
                        pstmt.executeUpdate();
                        pstmt.close();
                        conn.close();
                        response.sendRedirect("explore.jsp");
                    } catch (ClassNotFoundException e) {
                        out.println("<h2>JDBC Driver not found: " + e.getMessage() + "</h2>");
                    } catch (SQLException e) {
                        out.println("<h2>SQL Exception: " + e.getMessage() + "</h2>");
                    } catch (Exception e) {
                        out.println("<h2>Error submitting review: " + e.getMessage() + "</h2>");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
