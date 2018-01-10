<%-- 
    Document   : employeehome
    Created on : 22 Aug, 2015, 7:43:44 PM
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
            
            
            String email=null;
            HttpSession ses=request.getSession(false);
            if(ses!=null)
            {
               email =(String) ses.getAttribute("email");
               if(email==null)
                   response.sendRedirect("index.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>Hello <%=email%></h1>
        <hr>
        <br><br>
        <a href="LogoutService">Logout</a>
    </body>
</html>
