<%--
    Document   : loginAdmin
    Created on : Nov 14, 2013, 11:20:36 PM
    Author     : Adisorn
--%>

<%@page import="Model.Orderlist"%>
<%@page import="Model.Member"%>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page import="Model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:antiquewhite">
        <table width="100%" height ="600px"border="solid" align="center">
            <tr>
                <%=(request.getAttribute("msg")!=null?request.getAttribute("msg"):"")%>
                <td colspan="2" height="100px"></td>
            </tr>
            <td width="15%" valign="top" align="center" >
                <%Admin a = (Admin) session.getAttribute("ADMIN");
                    List<Member> member = Member.showMember();
                    List<Product> product = Product.showFlower();
                    if (a == null) {%>
                <form action="LoginAdmin" method="get">
                    <table>
                        <tr>
                            <td>username</td>
                            <td><input type="text" name="user"></td>
                        </tr>
                        <tr>
                            <td>password</td>
                            <td><input type="password" name="pass"></td>

                        </tr>
                        <tr>
                            <td><input type="submit" value="Login"></td>
                        </tr>
                    </table>
                </form>
                <%} else {%>
                <h1>::ADMIN::</h1>
                <button><a href='Logout'>Logout</a></button>
                <h2 style="margin:20px">::Manage::</h2>
                <ul class="nav nav-tabs" id="myTab">
                    <li style="float: none;"><a href="#Member"  data-toggle="tab" class="tab-pane">Member</a></li>
                    <li style="float: none;"><a href="#Product" data-toggle="tab">Product</a></li>
                    <li style="float: none;"><a href="#Order" data-toggle="tab">Order</a></li>
                </ul>
                <%}%>
            </td>
            <td width="80%"  valign="top">
                <%if (a == null) {
                %>
                <%} else {%>


                <div class="tab-content">
                    <div class="tab-pane active" id="Product">
                        <ul class="nav nav-tabs" id="myTab">
                            <li><a href="#insertProduct"  data-toggle="tab" class="tab-pane">Insert Product</a></li>
                            <li><a href="#deleteProduct" data-toggle="tab">Delete Product</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="insertProduct">
                                <form action="AddProduct">
                                    <table>
                                        <tr>
                                            <td>Product Name</td>
                                            <td><input type="text" name="productname"></td>
                                        </tr>
                                        <tr>
                                            <td>Detail</td>
                                            <td><input type="text" name="detail" class="input-mini"></td>
                                        </tr>
                                        <tr>
                                            <td>Price</td>
                                            <td><input type="number" name="price" class="input-mini"></td>
                                        </tr>
                                        <tr>
                                            <td>Color</td>
                                            <td><input type="text" name="color" class="input-mini"></td>
                                        </tr>
                                        <tr>
                                            <td>Image</td>
                                            <td><input type="file" name="img"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="submit" value="comfrim"></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                            <div class="tab-pane" id="deleteProduct">
                                <form action="DeleteProduct">
                                    <table>
                                        <tr>                                      
                                            <td></td>
                                            <td>Images</td>
                                            <td>No</td>
                                            <td>Name</td>                                        
                                            <td>Color</td>
                                            <td>Price</td>
                                            <td>Detail</td>
                                        </tr>
                                        <%
                                            for (Product p : product) {%>
                                        <tr>
                                            <td><input type="checkbox" name="chooseproductno" value="<%=p.getProductno()%>"></td>
                                            <td><img src="<%=p.getImg()%>" width="100px" height="100px"></td>                                       
                                            <td><%=p.getProductno()%></td>
                                            <td><%=p.getProductname()%></td>                                       
                                            <td><%=p.getColor()%></td>
                                            <td><%=p.getPrice()%></td>
                                            <td><%=p.getDetail()%></td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                            <td><input type="submit" value="comfrim"></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>

                            <!--                                        UD-->

                        </div>
                    </div>

                    <div class="tab-pane active" id="Member">
                        <ul class="nav nav-tabs" id="myTab">
                            <li><a href="#insertMember"  data-toggle="tab" class="tab-pane">Insert</a></li>
                            <li><a href="#deleteMember" data-toggle="tab">Delete</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="insertMember">
                                <form action="InsertMember" method="get">
                                    <table>
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
                                    </table>
                                </form>
                            </div>
                            <div class="tab-pane" id="deleteMember">
                                <form action="DeleteMember">
                                    <table>
                                        <tr>
                                            <td></td>
                                            <td>MemberNo</td>
                                            <td>username</td>
                                            <td>FirstName</td>
                                            <td>LastName</td>
                                            <td>Gender</td>
                                            <td>Phone</td>
                                        </tr>
                                        <%for (Member m : member) {%>
                                        <tr>
                                            <td><input type="checkbox" name="choosememberno" value="<%=m.getUsername()%>"></td>
                                            <td><%=m.getMemberno()%></td>
                                            <td><%=m.getUsername()%></td>
                                            <td><%=m.getFname()%></td>
                                            <td><%=m.getLname()%></td>
                                            <td><%=m.getGender()%></td>
                                            <td><%=m.getTelno()%></td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                            <td><input type="submit" value="comfrim"></td>
                                        </tr>
                                    </table>
                                </form>
                            </div>

                            <!--                                    UD-->

                        </div>
                    </div>

                    <div class="tab-pane active" id="Order">
                        <ul class="nav nav-tabs" id="myTab">
                            <li><a href="#ViewOrder"  data-toggle="tab" class="tab-pane">ViewOrder</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="ViewOrder">
                                <table width="600px">
                                    <tr>
                                        <td width="100px">OrderNo</td>
                                        <td width="100px">TotalPrice</td>
                                        <td width="100px">Date</td>
                                        <td width="300px">Address</td>
                                    </tr>
                                    <%
                                        List<Orderlist> listNew = Orderlist.showOrderlist();
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
                            </div>
                        </div>
                    </div>                 
                </div>        

                <%}%>



                </body>
                </html>
