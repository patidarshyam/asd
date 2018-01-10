<%-- 
    Document   : home
    Created on : 25 Aug, 2015, 7:47:34 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email=request.getParameter("email");
        %>
        <h1>Hello <%=email%>! Thanks for registration</h1><hr>
        <br>
        <p>
            we have sent you OTP to you registered email ID<br>
            you can verify that by follow this link<br>
            <a href="verify.jsp?email=<%=email%>">verify me</a>
        </p>
    </body>
</html>
