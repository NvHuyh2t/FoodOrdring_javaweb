<%@page import="java.util.Date"%>
<%@page import="Model.Login"%>
<%@page import="Model.BillDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserService"%>
<%@page import="constants.GlobalConstants"%>
<%
    UserService uService = new UserService(); 
    String tblNo = "0";
    if(request.getParameter("tableNo") != null)
        tblNo = request.getParameter("tableNo");    
    ArrayList<BillDetails> bDetails = uService.getBill(Integer.parseInt(tblNo));
    
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setHeader ("Expires", "0"); 
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>View Bill</title>
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

        /* Form Styling */
        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: white;
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

        .btn-primary {
            background-color: #3498db;
            color: white;
        }

        .btn-primary:hover {
            background-color: #2980b9;
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
        <h1>View Bill</h1>
        <form action="ViewBillToCook.jsp" method="post">
            <div class="form-group">
                <label for="table">Table Number:</label>
                <select class="form-control" name="tableNo">
                    <option disabled>-- Select --</option>
                    <option value="1"> Table 1</option> 
                    <option value="2"> Table 2</option>
                    <option value="3"> Table 3</option>
                    <option value="4"> Table 4</option>
                    <option value="5"> Table 5</option>                        
                </select>
            </div>
            <button type="submit" class="btn btn-primary">View Bill</button>
        </form>
        
        <br/>
        
        <% 
        if(bDetails != null && !bDetails.isEmpty()){
        %>            
            <table class="table table-striped table-hover">
                <tr>
                    <th>Serial Number</th>
                    <th>Order Name</th>
                    <th>Item Name</th>
                    <th>Item Cost</th>
                    <th>Item Quantity</th>
                    <th>Order Quantity</th>
                    <th>Amount</th>
                </tr>
                <%
                double total = 0; 
                for(int i = 0; i < bDetails.size(); i++){
                    BillDetails bd = bDetails.get(i);
                %>
                <tr>
                    <td><%= i + 1 %></td>
                    <td><%= bd.getOrderName() %></td>
                    <td><%= bd.getItemName() %></td>
                    <td><%= bd.getItemCost() %></td>
                    <td><%= bd.getItemQnt() %></td>
                    <td><%= bd.getOrderQnt() %></td>
                    <td>
                        <%= Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt() %>
                        <% total = (Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt()) + total; %>
                    </td>
                </tr>
                <% 
                }
                %>
                <tr>                        
                    <td colspan="6" style="text-align: center;"><b>Total</b></td>
                    <td><b><%= total %></b></td>                            
                </tr>
            </table>
        <%
        } else {
        %>
            <p>There are no bill details available for table <%= request.getParameter("tableNo") %></p>
        <% 
        }
        %>
    </div>
</div>
</body>
</html>
