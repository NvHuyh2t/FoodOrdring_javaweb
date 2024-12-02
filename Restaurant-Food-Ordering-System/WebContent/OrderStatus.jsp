<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Login" %>
<%@ page import="Model.OrderMaster" %>
<%@ page import="DAO.UserService" %>
<%@ page import="constants.GlobalConstants" %>
<%! 
    boolean isLastOrderDeliverd = Boolean.FALSE;
    boolean isLongTime = Boolean.FALSE;
%>

<%
Login login = (Login) session.getAttribute(GlobalConstants.USER);
if (login == null) {
    response.sendRedirect("LoginPage.jsp");
    return;
}

ArrayList<OrderMaster> orders = new UserService().getAllOrders(Integer.parseInt(login.getUserName()));

if (isLastOrderDeliverd) {	
    if (session.getAttribute("isLastOrdered") == null && session.getAttribute("time") == null) {
        session.setAttribute("time", new Date());
    }	
}

if (session.getAttribute("isLastOrdered") != null && session.getAttribute("time") != null) {		
    Date date = (Date) session.getAttribute("time");
    Date update = new Date();	
    long diff = date.getTime() - update.getTime();	 
    long diffHours = diff / (60 * 60 * 1000) % 24;
    if (diffHours >= -1) {
        isLongTime = Boolean.TRUE;
    }
} else { 
    session.setAttribute("time", null);
    session.setAttribute("isLastOrdered", null);
}	

response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <meta content="5" http-equiv="refresh" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Order Status</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: url('assets/images/res.jpg') no-repeat center center fixed;
            background-color: #f4f4f9;
            color: #333;
            line-height: 1.6;
        }

        h1, h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        a:hover {
            color: #0056b3;
        }

        /* Sidebar */
        .sidenav {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            color: white;
            padding: 20px;
            overflow-y: auto;
        }

        .sidenav a {
            display: block;
            color: #ffffff;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidenav a:hover {
            background-color: #495057;
        }

        hr {
            border-color: #495057;
        }

        /* Main Content */
        .main {
            margin-left: 270px;
            padding: 20px;
        }

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Special Messages */
        .alert {
            text-align: center;
            font-size: 1.2em;
            color: red;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="sidenav">
    <p><%= new Date() %></p>
    <hr />
    <a href="UserHome.jsp">Home</a>
    <a href="ViewCategory.jsp">Place Order</a>
    <a href="OrderStatus.jsp">View Order Status</a>
    <a href="ViewBill.jsp">View Bill</a>
    <a href="LoginPage.jsp">Log Out</a>
</div>

<div class="main">
    <div class="container">
        <h1>Order Status</h1>

        <% if (isLongTime) { %>
            <div class="alert">
                Your time is over! Please free this table for other customers.
            </div>
        <% } %>

        <table>
            <%
            if (orders != null && !orders.isEmpty()) {
            %>
            <tr>
                <th>Serial Number</th>
                <th>Table Number</th>
                <th>Name</th>
                <th>Status</th>
            </tr>
            <% for (int i = 0; i < orders.size(); i++) { 
                OrderMaster om = orders.get(i);
            %>
            <tr>
                <td>
                    <%= i + 1 %>
                    <input type="hidden" name="orderId" value="<%= om.getId() %>" />
                </td>
                <td><%= om.getTableNo() %></td>
                <td>
                    <a href="ViewOrderedItemsList.jsp?orderId=<%= om.getId() %>">
                        <%= om.getOrderName() %>
                    </a>
                </td>
                <td>
                    <% 
                    if (om.getOrderStat() != null) {
                        out.print(om.getOrderStat().name());
                        if (om.getOrderStat().name().equals(OrderMaster.OrderStatus.DELIVERED.name())) {
                            isLastOrderDeliverd = Boolean.TRUE;
                        } else {
                            isLastOrderDeliverd = Boolean.FALSE;
                        }
                    } else {
                        out.print("Unknown");
                        isLastOrderDeliverd = Boolean.FALSE;
                    }
                    %>
                </td>
            </tr>
            <% } } else { %>
            <tr>
                <td colspan="4">No Orders Available</td>
            </tr>
            <% } %>
        </table>
    </div>
</div>
</body>
</html>
