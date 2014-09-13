<%-- 
    Document   : Register
    Created on : Nov 12, 2013, 7:02:29 PM
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
        <form action="Register" method="post">
            </br></br></br>
            <table align="center" style="font-size: 20px;">
                <tr>
                    <td>username</td>
                    <td><input type="text" size="15" required name="username"></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><input type="password" size="15" required name="password"></td>
                </tr>
                <tr>
                    <td>Firstname</td>
                    <td><input type="text" size="15" required name="firstname"></td>
                </tr>
                <tr>
                    <td>Lastname</td>
                    <td><input type="text" size="15" required name="lastname"></td>
                </tr>
                <tr>
                    <td>gender</td>
                    <td><input type="radio" name="gender" value="M">male
                        <input type="radio" name="gender" value="F">female</td>
                </tr>
                <tr>
                <tr>
                    <td>telno</td>
                    <td><input type="text" size="15" required name="telno"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Accept"></td>
                    <td><input type="reset" value="Clear"></td>                   
                </tr>
                <tr>
                    <td><button><a href="Products.jsp">Back</a></button></td>
                </tr>
            </table>
            <center><%=request.getAttribute("msg") != null ? request.getAttribute("msg") : ""%></center>
        </form>
    </body>
</html>
