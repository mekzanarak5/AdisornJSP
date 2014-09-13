<%-- 
    Document   : Detail
    Created on : Nov 20, 2013, 4:03:25 AM
    Author     : Adisorn
--%>

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
        <%Product p = (Product) request.getAttribute("PRODUCT");%>
        <form action="AddToCart" method="get">
            <table width="500px" align="center">
                <tr>
                    <td>
                        <img src="<%=p.getImg()%>" width="500px" height="500px"></br>
                    </td>
                </tr>
                <tr>
                    <td>
                        ชื่อสินค้า :&nbsp;&nbsp;<%=p.getProductname()%></br></br>
                        ราคา :&nbsp;&nbsp;<fmt:formatNumber pattern="#,###.00" value="<%=p.getPrice()%>"/>&nbsp;Bath</br></br>
                        <%=p.getDetail()%></br></br>
                        <input type="hidden" name="selectedProduct" value="<%=p.getProductno()%>"/>
                        <input type="hidden" name="selectedProductName" value="<%=p.getProductname()%>"/>                        
                        <input class="btn btn-primary btn-lg" type="submit" value="AddToCart">
                        <button class="btn btn-primary btn-lg"><a href="Products.jsp">Back</a></button>
                        </br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
                        
                    </td>
                </tr>
            </table>
        </form>


    </body>
</html>
