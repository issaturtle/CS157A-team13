<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Logout Page</title>
</head>
<body>
    <h1>Logout</h1>

    <%
    // Invalidate the user's session to log them out
    session.invalidate();
    %>

    <p>You have been successfully logged out. <a href="login.jsp">Log in again</a></p>
</body>
</html>