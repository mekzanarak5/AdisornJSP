<%-- 
    Document   : LoginAndLogout
    Created on : Nov 12, 2013, 7:15:55 PM
    Author     : Adisorn
--%>

<%@page import="Model.Member"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Login" method="post">
            <table>
                <%
                    Member user = (Member) session.getAttribute("user");
                    String username = null;
                    String loginAndOut = null;

                    if (user == null) {%>
                <tr>
                    <td>User ID</td>
                    <td><input type="text" name="username" required="true" size="10" value="<%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%>"></td>
                    <td>&nbsp;&nbsp;&nbsp;<input type="submit" name="login" value="login">
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required="true" size="10"></td>
                    <td>&nbsp;&nbsp;&nbsp;<a href="Register.jsp">&nbsp;register&nbsp;</a></td>
         </tr>
                <%} else {
                        username = "" + user.getUsername() + "</a>";
                        loginAndOut = "<a href='Logout'>(Logout)</a>";
                    }
                %>
                </tr>
                <tr>
                    <td><%=username != null ? username : ""%></td>
                    <td><%=loginAndOut != null ? loginAndOut : ""%></td>     
                </tr>
            </table>
        </form> 
              
        <% if (username != null) {%>
        <form action="ViewProfile" method="get">
            <input type="hidden" name="username" value="<%=user.getUsername()%>"/>
            <input type="submit" class="btn btn-primary btn-lg" value="Profile">
        </form>
        <%} else {
                    System.out.print("");
                }%>
    </body>
</html>
