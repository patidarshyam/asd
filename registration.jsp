<%-- 
    Document   : registration
    Created on : 22 Aug, 2015, 7:31:37 PM
    Author     : root
--%>

<%@page import="dao.UserManager"%>
<%@page import="dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <%@include file="header.html" %>
        
        <jsp:useBean class="dto.User" id="myu"></jsp:useBean>
        <jsp:setProperty name="myu" property="*"></jsp:setProperty>
        
        
        <%
            String message="";
        
            if(myu.getName()!=null)
            {
                UserManager um=new UserManager();
                if(um.addUser(myu)>0)
                {
                    
                    response.sendRedirect("home.jsp?email="+myu.getEmail());
                }
                else
                {
                    message="Registration failed, try later";
                }
            }
        %>
        
       <h2>Employee Registration</h2>
        <form action="#" method="post"> 
        <table  cellpadding="5" style="border-style: solid;">
            <caption align="bottom">New Employee</caption>
            <tr>
                <td>Name:</td>
                <td>
                    <input type="text" name="name" required>
                </td>
            </tr>
            <tr>
                <td>Email ID:</td>
                <td>
                    <input type="email" name="email" required>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <input type="password" name="password" required>
                </td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td>
                    <input type="password" name="cpassword" required>
                </td>
            </tr>
            <tr>
                <td>Register me as:</td>
                <td>
                    <select name="role">
                        <option>Manager</option>
                        <option>Employee</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" value="Register">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <span><%=message%> </span>
                </td>
            </tr>
            <tr>
               
                <td colspan="2">
                    <a href="index.jsp">Already have Account</a>
                </td>
            </tr>
        </table>
            </form>
                
                    <%@include file="footer.html" %>
    </body>
</html>
