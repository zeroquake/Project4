<%-- 
    Document   : index
    Created on : Dec 13, 2011, 7:17:18 PM
    Author     : Pinitas
--%>

<%@page import="product.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import= "java.lang.*,java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart Scriptlets</title> 
    </head>
    <body>
        <center>
        <h1>Shopping Cart Scriptlets</h1>
       <%  
           double p = 0.0;
           float totalPrice = 0;
           
           Item Cafe = new Item();
           Cafe.setName("Cafe");
           p = Double.parseDouble(config.getInitParameter("Cafe"));
           Cafe.setPrice(p);
           
           Item Sugar = new Item();
           Sugar.setName("Sugar");
           p = Double.parseDouble(config.getInitParameter("Sugar"));
           Sugar.setPrice(p);
           
           Item Water = new Item();
           Water.setName("Water");
           p = Double.parseDouble(config.getInitParameter("Water"));
           Water.setPrice(p);
           
       %>
       
       <%
             Cookie[] cookies = request.getCookies();
             boolean foundCookie = false;
             String[] val = new String[3];
             int j = 0;
             
             for (int i = 0; i < cookies.length; i++) { 
                Cookie c = cookies[i];
                if (j < 3 && (c.getName().equals("quantity1") || c.getName().equals("quantity2") || c.getName().equals("quantity3"))) {
                    val[j]=c.getValue();
                    foundCookie = true;
                    j++;
                }
             }  

             if (!foundCookie) {
                for (int i=0; i<3; i++){
                    val[i]="0";
                }
             }
             Cafe.setQuantity(val[0]);
             Sugar.setQuantity(val[1]);
             Water.setQuantity(val[2]);
        %>
        
        <form action="index.jsp" method="POST">
        
            <table border="2">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <%
                            if(request.getParameter("quantity1")!=null)Cafe.setQuantity(request.getParameter("quantity1"));
                            if(request.getParameter("quantity2")!=null)Sugar.setQuantity(request.getParameter("quantity2"));
                            if(request.getParameter("quantity3")!=null)Water.setQuantity(request.getParameter("quantity3"));
                        %>
                        <th>Sum</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Cafe</td>
                        <td><%=Cafe.getPrice() %></td>                       
                        <td><input  type="text" name="quantity1" value="<%
                        out.println(Cafe.getQuantity());%>"</td>
                       <td><%out.println(Cafe.getSum());%> </td>
                    </tr>
                    <tr>
                        <td>Sugar</td>
                        <td><%=Sugar.getPrice() %></td>
                        <td><input type="text" name="quantity2" value="<%
                        out.println(Sugar.getQuantity());%>" /></td>                      
                        <td><%out.println(Sugar.getSum());%></td>
                    </tr>
                    <tr>
                        <td>Water</td>
                        <td><%=Water.getPrice() %></td>
                        <td><input type="text" name="quantity3" value="<%
                        out.println(Water.getQuantity());%>" /></td>
                        <td><%out.println(Water.getSum());%></td>
                    </tr>
                </tbody>
            </table>
                    <br>
                    <input type="submit" onclick="
                  <%
                    if(request.getParameter("quantity1")!=null)Cafe.setQuantity(request.getParameter("quantity1")); Cafe.setSum();
                    String tmp;
                    tmp = String.valueOf(Cafe.getQuantity());
                    Cookie c1 = new Cookie("quantity1", tmp);
                    c1.setMaxAge(24*60*60);
                    response.addCookie(c1);
                    if(request.getParameter("quantity2")!=null)Sugar.setQuantity(request.getParameter("quantity2")); Sugar.setSum();
                    tmp = String.valueOf(Sugar.getQuantity());
                    Cookie c2 = new Cookie("quantity2", tmp);
                    c2.setMaxAge(24*60*60);
                    response.addCookie(c2);
                    if(request.getParameter("quantity3")!=null)Water.setQuantity(request.getParameter("quantity3")); Water.setSum();
                    tmp = String.valueOf(Water.getQuantity());
                    Cookie c3 = new Cookie("quantity3", tmp);
                    c3.setMaxAge(24*60*60);
                    response.addCookie(c3);
                  %>" value="Add to Cart" name="Add to Cart" />
            <table border="5">
                <thead>
                    <tr>
                        <th>Total</th>
                        <th>
                           <% 
                                totalPrice = Cafe.getSum() + Sugar.getSum() + Water.getSum();
                                out.println(totalPrice);
                            %>
                        </th>
                    </tr>
                </thead>                
            </table>
        </form>
        <br>
        <button type="button" ONCLICK="window.location.href='report.html'">Report!</button>
        <button type="button" ONCLICK="window.location.href='ShoppingCartScriptlets.rar'">Code!</button>
        <br>
        </center>
    </body>
</html>