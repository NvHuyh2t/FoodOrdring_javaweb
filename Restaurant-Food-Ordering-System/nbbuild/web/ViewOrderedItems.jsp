<%@page import="java.util.Date"%>
<%@page import="Model.OrderDetails"%>
<%@page import="constants.GlobalConstants"%>
<%@page import="Model.OrderMaster.OrderStatus"%>
<%@page import="Model.OrderMaster.OrderStatus"%>
<%@page import="Model.OrderMaster"%>
<%@page import="DAO.CookServices"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<OrderDetails> orders = null;
    if(request.getParameter("orderId") != null )
        orders = new CookServices().getAllItems(Integer.parseInt(request.getParameter("orderId")));
    
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setHeader ("Expires", "0"); 
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>View Ordered Items</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            color: #333;
        }

        /* Sidebar Styling */
        .sidenav {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50;
            padding: 20px;
            color: white;
        }

        .sidenav a {
            display: block;
            color: #ffffff;
            padding: 10px;
            margin-bottom: 10px;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        .sidenav a:hover {
            background-color: #34495e;
        }

        hr {
            border-color: #34495e;
        }

        /* Main Content Styling */
        .main {
            margin-left: 270px;
            padding: 20px;
        }

        .container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2980b9;
        }

        /* Table Styling */
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        td {
            background-color: #ecf0f1;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        /* Button Styling */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        .btn-info {
            background-color: #16a085;
            color: white;
        }

        .btn-info:hover {
            background-color: #1abc9c;
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        /* Select Box */
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: white;
        }
    </style>
</head>

<body>
<div class="sidenav">
    <a href="UserHome.jsp"> <%=new Date() %></a>
    <hr />
    <a href="AddCategory.jsp"> Add Category </a>
    <a href="AddItem.jsp"> Add Item </a>
    <a href="ViewOrder.jsp"> View Order </a>
    <a href="ViewBillToCook.jsp"> View Bill </a>
    <a href="LoginPage.jsp"> Log Out </a>
</div>

<div class="main">
    <div class="container">
        <h1>View Ordered Items</h1>
        <table class="table table-striped table-hover">
        <%
            if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
                out.write("<h3>" + GlobalConstants.MESSAGE + " </h3>");
                GlobalConstants.MESSAGE = "";
            }
        %>
        <%
            if(orders != null && orders.size() > 0){
        %>
            <tr>
                <th>Serial Number</th>
                <th>Table No</th>
                <th>Order ID</th>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Actual Status</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        <%
            for(int i = 0; i < orders.size(); i++) {
                OrderDetails om = orders.get(i);
        %>
            <form action="cook?action=updateItemStatus" method="post">
                <tr>
                    <td><%= i + 1 %></td>
                    <td><%= om.getTableNo() %></td>
                    <td><%= om.getId() %>
                        <input type="hidden" name="orderId" value="<%= om.getId() %>" />
                        <input type="hidden" name="itemId" value="<%= om.getItemId() %>" />
                    </td>
                    <td><%= om.getItemName() %></td>
                    <td><%= om.getQnt() %></td>
                    <td><%= om.getOrderStat().name() %></td>
                    <td>
                        <select name="status" class="form-control">
                            <option disabled selected value>-- Select --</option>
                            <%
                                for(OrderDetails.OrderStatus os : OrderDetails.OrderStatus.values()) { 
                            %>
                            <option><%= os.name() %></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                    <td><button type="submit" class="btn btn-info">Update Status</button></td>
                </tr>
            </form>
        <%
            }
        } else {
        %>
            <tr>
                <td colspan="8" class="text-center">There is no order available</td>
            </tr>
        <%
        }
        %>
        </table>   
        
        <br/>
        <a href="ViewOrder.jsp"><button class="btn btn-danger">Go Back</button></a>                  
    </div>
</div>					
</body>
</html>
