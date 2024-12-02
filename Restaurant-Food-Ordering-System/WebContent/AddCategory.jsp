<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Date"%>
<%@page import="constants.GlobalConstants"%>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires", "0"); 
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Add Category</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style>
        /* Sidenav Styles */
        .sidenav {
            height: 100%;
            width: 240px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50;
            padding-top: 20px;
            color: #ecf0f1;
        }

        .sidenav a {
            padding: 10px 20px;
            text-decoration: none;
            font-size: 16px;
            color: #ecf0f1;
            display: block;
            border-radius: 5px;
            margin: 10px 0;
        }

        .sidenav a:hover {
            background-color: #34495e;
            color: #ffffff;
        }

        .sidenav hr {
            border: 1px solid #7f8c8d;
        }

        .main {
            margin-left: 260px;
            padding: 20px;
        }

        /* Form Styling */
        h1 {
            font-size: 32px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #34495e;
        }

        .form-control {
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        }

        .btn-primary {
            background-color: #3498db;
            border-color: #2980b9;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #1c638c;
        }

        /* Success/Error Message */
        h3 {
            color: #e74c3c;
            font-size: 18px;
            margin-top: 20px;
        }

        /* Table adjustments for layout */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ecf0f1;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
    </style>
</head>

<body>
    <div class="sidenav">
        <a href="UserHome.jsp"><%=new Date() %></a>
        <hr />
        <a href="AddCategory.jsp">Add Category</a>
        <a href="AddItem.jsp">Add Item</a>
        <a href="ViewOrder.jsp">View Order</a>
        <a href="ViewBillToCook.jsp">View Bill</a>
        <a href="LoginPage.jsp">Log Out</a>
    </div>

    <div class="main">
        <div class="container">
            <h1>Add Category</h1>
            <form action="cook?action=addCategory" method="post">
                <% if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) { %>
                <h3><%= GlobalConstants.MESSAGE %></h3>
                <% GlobalConstants.MESSAGE = ""; } %>
                <div class="form-group">
                    <label for="category">Category Name:</label>
                    <input type="text" class="form-control" name="cate" placeholder="Enter category name" required />
                </div>
                <button type="submit" class="btn btn-primary">Add category to the Menu</button>
            </form>
        </div>
    </div>
</body>

</html>
