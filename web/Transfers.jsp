<%-- 
    Document   : Transfers
    Created on : Nov 19, 2013, 7:48:13 PM
    Author     : Adisorn
--%>

<%@page import="Model.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">  
    </head>
    <body style="background: url(images/bghomepage.jpg)">
        <div class="container">
            <div class="headerright">
                <form action="ResetCart" method="get">
                    <input type="submit" value="BACK">
                </form>
            </div>
            </br></br>
            <table align="center" style="font-size: 20px;" width="600px">
                <tr>
                    <td width="200px"></td>
                    <td>ธนาคารไทยพานิชย์ เลขบัญชี 55555555555</td>
                </tr>
                <tr>
                    <td></td>
                    <td>ชื่อ นายอดิศร ยังให้ผล</td>
                </tr>
            </table>
            </br></br>
            <div class="transfers">
                </br>
                <%Member user = (Member) session.getAttribute("user");%>
                OrderNo&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("orderno")%></br>
                FristName&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getFname()%></br>
                LastName&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=user.getLname()%></br>
                Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("address")%></br></br>
                <table width="500px">
                    <tr>
                        <td width="100px">No</td>
                        <td width="100px">ProductName</td>
                        <td width="100px">Unit</td>
                        <td width="100px">Price</td>
                        <td width="100px">Total</td>
                    </tr>    
                    <c:set var="no" value="1"/>
                    <c:forEach items="${cart.lineItems}" var="line">
                        <tr>
                            <td>${no}</td>
                            <td>${line.product.productname}</td>
                            <td>${line.unit}</td>
                            <td><fmt:formatNumber pattern="#,###.##" value="${line.product.price}"/></td>
                            <td><fmt:formatNumber pattern="#,###.##" value="${line.total}"/></td>
                            <c:set var="no" value="${no+1}"/>
                        </tr>
                    </c:forEach>

                    <tr>
                        <td colspan="4">total</td>
                        <td colspan="4"><fmt:formatNumber pattern="#,###.##" value="${cart.total}"/></td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
