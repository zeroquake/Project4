<%-- 
    Document   : index
    Created on : Dec 14, 2011, 12:29:46 AM
    Author     : Pinitas
--%>
<%@page import="product.Item"%>
<%@page import= "java.lang.*,java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart EL</title>
    </head>
    <center>
    <body>
    <center>
        <h1>Shopping Cart EL</h1>
        
        <form action="index.jsp" method="GET" >
            <body>
                <jsp:useBean id= "Total" class="product.TotalPrice" scope="session"/>
                
                <jsp:useBean id= "Cafe"  class="product.Item" scope="session"/>
                <jsp:setProperty name="Cafe" property="name" value="Cafe"/>
                <jsp:setProperty name="Cafe" property="price" value ="18.5"  />
                
                <jsp:useBean id= "Sugar"  class="product.Item" scope="session"/>
                <jsp:setProperty name="Sugar" property="name" value="Sugar"/>
                <jsp:setProperty name="Sugar" property="price" value="6.95" />
                
                <jsp:useBean id= "Water"  class="product.Item" scope="session"/>
                <jsp:setProperty name="Water" property="name" value="Water"/>
                <jsp:setProperty name="Water" property="price" value="1.29" />

                <form action="index.jsp" method="POST" >
                <table border="1">

                    <thead>
                        <tr>
                            <th>Product </th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>

                            <td><jsp:getProperty name="Cafe" property="name"/></td>
                            <td><jsp:getProperty name="Cafe" property="price"/></td>
                            <jsp:setProperty name="Cafe" property="quantity" param="quantity"/>
                            <td><input type="text" name="quantity" value="<jsp:getProperty name="Cafe" property="quantity"/>" /></td>
                            <jsp:setProperty name="Cafe" property="quantity" param="quantity"/>
                            <td><jsp:getProperty name="Cafe" property="sum"/></td>
                        </tr>
                        
                        <tr>
                            <td><jsp:getProperty name="Sugar" property="name"/></td>
                            <td><jsp:getProperty name="Sugar" property="price"/></td>
                            <jsp:setProperty name="Sugar" property="quantity" param="quantity2"/>
                            <td><input type="text" name="quantity2" value="<jsp:getProperty name="Sugar" property="quantity"/>" /></td>
                            <jsp:setProperty name="Sugar" property="quantity" param="quantity2"/>
                            <td><jsp:getProperty name="Sugar" property="sum"/></td>
                        </tr>
                        
                        <tr>
                            <td><jsp:getProperty name="Water" property="name"/></td>
                            <td><jsp:getProperty name="Water" property="price"/></td>
                            <jsp:setProperty name="Water" property="quantity" param="quantity3"/>
                            <td><input type="text" name="quantity3" value="<jsp:getProperty name="Water" property="quantity"/>" /></td>
                            <jsp:setProperty name="Water" property="quantity" param="quantity3"/>
                            <td><jsp:getProperty name="Water" property="sum"/></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <button type="submit" onclick="<jsp:setProperty name="Total" property="total" value="${Cafe.sum + Sugar.sum + Water.sum}"/>
                       ">Add to Cart!</button>
                
                <table border="1">

                <thead>            
                    <tr>
                       <td>Total</td>
                        <jsp:setProperty name="Total" property="total" param="${Cafe.sum + Sugar.sum + Water.sum}"/>
                        <td>${Total.total}</td>
                    </tr>
                </tbody>
            </table>
             <br>
            <button type="button" ONCLICK="window.location.href='report.html'">Report!</button>
            <button type="button" ONCLICK="window.location.href='ShoppingCartEL.rar'">Code!</button>
            </center>
        </body>
    </form>   
</html>