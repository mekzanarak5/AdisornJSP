<%-- 
    Document   : Index
    Created on : Nov 12, 2013, 10:20:02 PM
    Author     : Adisorn
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">   
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
            <div class="leftContent">
                <br>
                <img src="images/Banner.png" width="200px" height="200px">
                <br>
                <img src="images/Banner.png" width="200px" height="200px">
                <br>
                <img src="images/Banner.png" width="200px" height="200px">
                <br>
                <img src="images/Banner.png" width="200px" height="200px">
            </div>
            <div class="rightContent">
                <%
                    List<Product> listNew = Product.showFlowerHomePage();
                    for (Product p : listNew) {
                %>

                <div class="product">
                    <br>
                    <form action="Detail" method="get">
                    <button name="chooseProduct" value="<%=p.getProductno()%>">
                        <img src="<%=p.getImg()%>" width="200px" height="200px">
                    </button></br>
                    </form>
                    <form action="AddToCart" method="get">  
                        <%=p.getProductname()%>
                        <fmt:formatNumber pattern="#,###.00" value="<%=p.getPrice()%>"/>&nbsp;Bath</br>
                        <input type="hidden" name="selectedProduct" value="<%=p.getProductno()%>"/>
                        <input type="hidden" name="selectedProductName" value="<%=p.getProductname()%>"/>                        
                        <input class="btn btn-primary btn-lg" type="submit" value="AddToCart"></br></br>
                    </form>
                </div>

                <%}%>
            </div>
            <div class="footer">
                </br></br>
                INT303 Web Programming </br>
                Design by Adisorn Yunghaipol</br>
            </div>
        </div>

    </body>
</html>
