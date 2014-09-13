<%-- 
    Document   : keep
    Created on : Nov 20, 2013, 7:04:19 AM
    Author     : Adisorn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!--        UpdateAdmin-->
        <div class="tab-pane" id="updateProduct">
                                <form action="UpdateProduct">
                                    <table>
                                        <tr>
                                            <td>Product Id</td>
                                            <td>Product Name</td>
                                            <td>Price</td>
                                            <td>Color</td>

                                        </tr>
                                        <%for (Product p : product) {%>
                                        <tr>
                                            <td><%=p.getProductno()%></td>
                                            <td><input type="text" value="<%=p.getProductname()%>" name="productName"></td>
                                            <td><input type="text" value="<%=p.getDetail()%>" name="detail"></td>
                                            <td><input type="text" value="<%=p.getPrice()%>" name="price"></td>
                                            <td><input type="text" value="<%=p.getColor()%>" name="color"></td>
                                            <td><button type="submit" value="<%=p.getProductno()%>">edit</a></button></td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                        </tr>
                                    </table>
                                </form>
                            </div>
<!--        UpdateAdmin-->        
<div class="tab-pane" id="updateMember">
                                <form action="Pass">
                                    <table>
                                        <tr>
                                            <td>MemberNo</td>
                                            <td>username</td>
                                            <td>password</td>
                                            <td>FirstName</td>
                                            <td>LastName</td>
                                            <td>Gender</td>
                                            <td>Phone</td>
                                            <td></td>
                                        </tr>
                                        <%for (Member m : member) {%>
                                        <tr>
                                            <td><%=m.getMemberno()%></td>
                                            <td><%=m.getUsername()%></td>
                                            <td><%=m.getFname()%></td>
                                            <td><%=m.getLname()%></td>
                                            <td><%=m.getGender()%></td>
                                            <td><%=m.getTelno()%></td>
                                            <td><button type="submit" name="username" value="<%=m.getUsername()%>">edit</a></button></td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                        </tr>
                                    </table>
                                </form>
                            </div>   
                                        
                                        
    </body>
</html>
