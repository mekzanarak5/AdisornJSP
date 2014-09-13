<%-- 
    Document   : AddToCart
    Created on : Nov 12, 2013, 7:02:12 PM
    Author     : Adisorn
--%>
<%@page import="Model.Member"%>
<%@page import="Model.Orderlist"%>
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
            <div class="viewcart">
            <% Member m = (Member) session.getAttribute("user");
                Orderlist o = new Orderlist();
            %>
            <form action="InsertToDatabase" method="get">
                </br></br></br>
                <table width="600px">
                    <tr>                        
                        <td width="100px">No</td>
                        <td width="100px">ProductName</td>
                        <td width="100px">Unit</td>
                        <td width="100px">Price</td>
                        <td></td>
                    </tr>    
                    <c:set var="no" value="1"/>
                    <c:forEach items="${cart.lineItems}" var="line">
                        <tr>
                            <td>${no}</td>
                            <td>${line.product.productname}</td>
                            <td><input type="number" name="quantity" value="${line.unit}" required/></td>

                            <td><fmt:formatNumber pattern="#,###.##" value="${line.product.price}"/></td>
                            <td><fmt:formatNumber pattern="#,###.##" value="${line.total}"/></td>
                            <td><button name="removeOrder" value="${line.product.productno}">x</button></td>
                            <c:set var="no" value="${no+1}"/>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td colspan="4">total</td>
                        <td colspan="4"><fmt:formatNumber pattern="#,###.##" value="${cart.total}"/></td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <td>Address :</td>
                        <td><textarea cols="50" rows="3" name="address"></textarea></td>
                    </tr>
                </table>
                <c:forEach items="${cart.lineItems}" var="line">
                    <input type="hidden" name="orderno" value="<%=o.countMaxOrderNo()%>">
                    <input type="hidden" name="memberno" value="<%=m.getMemberno()%>">
                    <input type="hidden" name="productno" value="${line.product.productno}">
                    <input type="hidden" name="productname" value="${line.product.productname}">

                    <input type="hidden" name="totalprice" value="${cart.total}">
                </c:forEach>
                <button><a href="Products.jsp">Back</a></button>
                <button type="submit">Submit Order</button>
            </form>
        </div>
        </div>
    </body>
</html>
