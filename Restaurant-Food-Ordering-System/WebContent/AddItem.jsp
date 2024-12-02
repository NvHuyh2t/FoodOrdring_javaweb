<%@page import="java.util.Date"%>
<%@page import="constants.GlobalConstants"%>
<%@page import="Model.Category"%>
<%@page import="DAO.CookServices"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Category> cats = new CookServices().getAllCategorys();
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setHeader ("Expires", "0"); 
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Add Item</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        /* Sidebar */
        .sidenav {
            height: 100%;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
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
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007bff;
        }

        /* Form Styling */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        select {
            background-color: #ffffff;
        }

        /* Buttons */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #000000;
            color: white;
        }

        .btn-primary:hover {
            background-color: #333333;
        }
    </style>
</head>

<body>

<div class="sidenav">
    <a href="UserHome.jsp"> <%= new Date() %></a>
    <hr />
    <a href="AddCategory.jsp">Add Category</a>
    <a href="AddItem.jsp">Add Item</a>
    <a href="ViewOrder.jsp">View Order</a>
    <a href="ViewBillToCook.jsp">View Bill</a>
    <a href="LoginPage.jsp">Log Out</a>
</div>

<div class="main">
  <div class="container">
    <h1>Add Item</h1>
    <form action="cook?action=addItem" method="post">
      <%
        if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
            out.write("<h3>" + GlobalConstants.MESSAGE + "</h3>");
            GlobalConstants.MESSAGE = "";
        }
      %>
      <div class="form-group">
        <label for="item">Item Name:</label>
        <input type="text" class="form-control" name="itemName" size="22" />
      </div>

      <div class="form-group">
        <label for="category">Category:</label>
        <select class="form-control" name="categoryId">
          <option disabled selected value>-- Select --</option>
          <%
            if (cats != null && cats.size() != 0) { 
                for (int i = 0; i < cats.size(); i++) {
                    Category cat = cats.get(i);
          %>
              <option value="<%= cat.getId() %>"> <%= cat.getCategoryName() %> </option>
          <%
                }
            }
          %>
        </select>
      </div>

      <div class="form-group">
        <label for="quantity">Quantity:</label>
        <input type="number" class="form-control" name="qnt" size="30" />
      </div>

      <div class="form-group">
        <label for="cost">Cost:</label>
        <input type="number" class="form-control" name="cost" size="22" />
      </div>

      <button type="submit" class="btn btn-primary">Add item to the Category</button>
    </form>
  </div>
</div>

</body>
</html>
