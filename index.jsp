<%-- 
    Document   : index
    Created on : 22 Aug, 2015, 7:30:19 PM
    Author     : root
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="dao.UserManager"%>
<%@page import="dto.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="css/mycss.css">
    </head>
    <body>
        <%
            //code for verify account
            String message="";
            
            String email =request.getParameter("email");
            String password =request.getParameter("password");
            String rem =request.getParameter("rem");

            if(email!=null && password!=null)
            {

                User u=new User(email, password);

                UserManager um=new UserManager();
                String role = um.isAuthenticate(u);

                if(role.equals(""))
                    message="Invalid Email ID / Password";
                else
                {   
                    HttpSession ses=request.getSession();
                    ses.setAttribute("email", u.getEmail());
                    ses.setAttribute("pass", u.getPassword());
                    ses.setMaxInactiveInterval(10);
                    
                    String url="";
                    if(role.equals("admin"))
                        url ="adminhome.jsp";
                    else if(role.equals("Employee"))
                        url = "employeehome.jsp";
                    
                    response.sendRedirect(url);
                }
            }
        %>
        
        <div>
            <div id="news">
                
            </div>
            <div id="work">
                    <h2>User Login</h2>
                    <form action="#" method="get"> 
                    <table  cellpadding="5" style="border-style: solid;">
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
                    <td colspan="2" align="left">
                        <input type="checkbox" name="rem">Remember Me
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" value="Sign In">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <span><%=message%> </span>
                    </td>
                </tr>
                <tr>
                    <td >
                        <a href="forgotpass.jsp">Forgot Password</a>
                    </td>
                    <td align="right">
                        <a href="registration.jsp">Not a member</a>
                    </td>
                </tr>
            </table>
                </form>
                    <a href="http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=test.meeteish2@gmail.com:meeteish@31&senderID=TEST SMS&receipientno=9755091101&dcs=0&msgtxt=Hello Friends!&state=4">Send Message</a>
                
            </div>
            <div id="adv">
                
            </div>
        </div>
        
        
                
               
                
    </body>
</html>
