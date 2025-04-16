<%-- 
    Document   : register
    Created on : 10-Nov-2024, 10:14:46 am
    Author     : subha
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <form action="registerServlet" method="post">
            <h2>Register</h2>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <button type="submit" class="btn">Register</button>
        </form>
    </div>
</body>
</html>
