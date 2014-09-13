<%-- 
    Document   : Login
    Created on : Nov 20, 2013, 8:05:45 AM
    Author     : Adisorn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background: url(images/bghomepage.jpg)">
        <form action="Login" method="post">
            </br></br></br>
            <table align="center" style="font-size: 25px;">
                <tr>
                    <td>User ID</td>
                    <td><input type="text" name="username" required="true" size="10" value="<%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%>"></td>
                    
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required="true" size="10"></td>
                    
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;<input type="submit" name="login" value="login"></td>
                    <td>&nbsp;&nbsp;&nbsp;<a href="Register.jsp">&nbsp;register&nbsp;</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
