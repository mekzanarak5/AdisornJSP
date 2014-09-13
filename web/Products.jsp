<%-- 
    Document   : Products
    Created on : Nov 12, 2013, 7:14:05 PM
    Author     : Adisorn
--%>

<%@page import="Model.LineItem"%>
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
                <div class="headerleft">
                    <c:choose>
                        <c:when test="${cart != null }">
                            <a href='ViewCart'>View Cart </a>(${cart.unitItem})
                        </c:when>
                    </c:choose>               
                </div>
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
            </div></br>
            <div class="searchright">
                <form action="SearchProduct" method="post">
                    Search product : <input type="text" name="search" size="30" required="" value="${param.search}"/>
                    <input type="submit" value="search"/>
                </form>
            </div>
            <div class="searchright">
                <form action="SearchPrice" method="post">
                    Search price : <input type="text" name="search" size="30" required="" value="${param.search}"/>
                    <input type="submit" value="search"/>
                </form>
            </div></br></br>           
            <%
                if (request.getAttribute("search") == null) {
                    List<Product> listNew = Product.showFlower();
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

            <%}
            } else {
            %>

            <c:forEach items="${pf}" var="p">
                <div class="product">
                    </br>
                    <form action="Detail" method="get">
                        <button name="chooseProduct" value="${p.productno}">
                            <img src="${p.img}" width="200px" height="200px">
                        </button></br>
                        <form action="AddToCart" method="get"> 
                            ${p.productname}
                            <fmt:formatNumber pattern="#,###.00" value="${p.price}"/>&nbsp;Bath</br>
                            <input type="hidden" name="selectedProduct" value="${p.productno}"/>
                            <input type="hidden" name="selectedProductName" value="${p.productname}"/>
                            <input class="btn btn-primary btn-lg" type="submit" value="AddToCart"></br></br>
                        </form>
                </div>
            </c:forEach>     
            <%  }%>

        </div>
    </body>
</html>
