<%-- 
    Document   : Contact
    Created on : Nov 20, 2013, 7:29:00 AM
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
        <div class="container">
            <div class="header">
                <div class="headerright">
                    <jsp:include page="LoginAndLogout.jsp"/>
                </div>
            </div>
            <div class="navbar">
                <ul>
                    <li><a href="HomePage.jsp">HOME</a></li>
                    <li><a href="Products.jsp">PRODUCT</a></li>
                    <li><a href="Contact.jsp">CONTACT</a></li>
                    <li><a href="loginAdmin.jsp">ADMIN</a></li>
                </ul>
            </div>
                </br></br></br>
                <table align="center" style="font-size: 30px;" >
                    <tr>
                        <td>E-mail </td>
                        <td>: kindwachike@facebook.com</td>
                    </tr>
                    <tr>
                        <td>telephone </td>
                        <td>: 0817279759</td>
                    </tr>
                    <tr>
                        <td>Facebook </td>
                        <td>: www.facebook.com/kindwachike</td>
                    </tr>
                </table>
            </div>
            <div class="footer">
            </div>
        </div>

    </body>
</html>
