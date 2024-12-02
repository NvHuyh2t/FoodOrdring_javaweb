<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Date"%>
<%@page import="DAO.UserService"%>
<%@page import="Model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="constants.GlobalConstants"%>
<%
    ArrayList<Category> cats = new UserService().getAllCategorys();
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Menu Categories</title>
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
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        h1, h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        a:hover {
            color: #1abc9c;
        }

        /* Sidebar */
        .sidenav {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50;
            color: #fff;
            padding: 20px;
            overflow-y: auto;
        }

        .sidenav a {
            display: block;
            color: #ecf0f1;
            padding: 10px 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .sidenav a:hover {
            background-color: #1abc9c;
            color: #fff;
        }

        hr {
            border-color: #7f8c8d;
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
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #34495e;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
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
        <h1>Menu Categories</h1>
        <% if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) { %>
            <h3><%= GlobalConstants.MESSAGE %></h3>
            <% GlobalConstants.MESSAGE = ""; %>
        <% } %>
        <table>
            <tr>
                <th>Sr No</th>
                <th>Name</th>
            </tr>
            <% if (cats != null && cats.size() != 0) {
                for (int i = 0; i < cats.size(); i++) {
                    Category cat = cats.get(i);
            %>
            <tr>
                <td><%= i + 1 %></td>
                <td><a href="ViewItems.jsp?catId=<%= cat.getId() %>"><%= cat.getCategoryName() %></a></td>
            </tr>
            <% } } %>
        </table>
    </div>
</div>
</body>
</html>
