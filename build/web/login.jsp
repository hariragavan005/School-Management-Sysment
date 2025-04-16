<%-- 
    Document   : login
    Created on : 10-Nov-2024, 9:58:37 am
    Author     : subha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <form action="loginServlet" method="post">
            <h2>Login</h2>
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required placeholder="Enter your username"><br><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password"><br><br>

            <button type="submit" class="btn">Login</button>

            <div class="links">
                <a href="register.jsp">New User? Sign Up</a><p></p>
               
            </div>
        </form>
    </div>
</body>
</html>

