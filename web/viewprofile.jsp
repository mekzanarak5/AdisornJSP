<%-- 
    Document   : viewprofile
    Created on : Nov 20, 2013, 6:04:45 AM
    Author     : Adisorn
--%>

<%@page import="Model.Orderlist"%>
<%@page import="java.util.List"%>
<%@page import="Model.Member"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background: url(images/bghomepage.jpg)">
        <%Member user = (Member) session.getAttribute("user");%>
        </br></br>
        <div class="container">
            FristName&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getFname()%></br>
            LastName&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getLname()%></br>
            Gender&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getGender()%></br>
            tel&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getTelno()%></br>
            </br>
            <table width="700px">
                <tr>
                    <td width="100px">OrderNo</td>
                    <td width="100px">TotalPrice</td>
                    <td width="100px">Date</td>
                    <td width="300px">Address</td>
                </tr>    
                
                
                
                <%
                    List<Orderlist> listNew = Orderlist.ShowOrderlistbyMemberno(user.getMemberno());
                    for (Orderlist o : listNew) {
                        
                %>                
                <tr>
                    
                    <td><%=o.getOrderno()%></td>
                    <td><%=o.getTotalprice()%></td>
                    <td><%=o.getDate()%></td>
                    <td><%=o.getAddress()%></td>
                </tr>
                
                
                
                <%}%>
                
            </table>
            </br></br>
            <button class="btn btn-primary btn-lg"><a href="Products.jsp">Back</a></button>
        </div>
    </body>
</html>
