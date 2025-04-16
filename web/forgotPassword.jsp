<%-- 
    Document   : forgotPassword
    Created on : 10-Nov-2024, 10:15:41 am
    Author     : subha
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body>
    <form action="ForgotPasswordServlet" method="post">
        <h2>Forgot Password</h2>
        <label>Enter your registered email:</label><br>
        <input type="email" name="email" required placeholder="Enter your email"><br><br>
        <button type="submit">Retrieve Password</button>
    </form>
</body>
</html>
