<%-- 
    Document   : verify
    Created on : 25 Aug, 2015, 7:50:23 PM
    Author     : root
--%>

<%@page import="dao.UserManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String message="";
            String email=request.getParameter("email");
            String otp=request.getParameter("otp");
            String hdemail=request.getParameter("hdemail");
            
            if(otp!=null&&hdemail!=null)
            {
                UserManager um=new UserManager();
                if(um.verify(otp, hdemail))
                {
                    message="You are verified, please login";
                }
                else
                {
                    message="Invalid OTP entered";
                }
            }
        %>
        <h1>Verify User</h1>
        <form>
            Enter OTP (sent you when you registered)<br>
            <input type="password" name="otp"><br>
            <input type="submit" value="Proceed">
            <input type="hidden" name="hdemail" value="<%=email%>">
        </form>
        <br><span><%=message%> </span>
    </body>
</html>
