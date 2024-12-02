<%@page import="java.util.Date"%>
<%@page import="Model.OrderDetails"%>
<%@page import="constants.GlobalConstants"%>
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
<html>
<head>
	<meta http-equiv="refresh" content="4" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Ordered Items</title>
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

		/* Table Styling */
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
		}

		table, th, td {
			border: 1px solid #ddd;
		}

		th {
			background-color: #007bff;
			color: white;
			padding: 10px;
			text-align: left;
		}

		td {
			padding: 10px;
		}

		tr:nth-child(even) {
			background-color: #f2f2f2;
		}

		tr:hover {
			background-color: #ddd;
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
			background-color: #007bff;
			color: white;
		}

		.btn-primary:hover {
			background-color: #0056b3;
		}

		.btn-danger {
			background-color: #dc3545;
			color: white;
		}

		.btn-danger:hover {
			background-color: #c82333;
		}
	</style>
</head>
<body>

<div class="sidenav">
    <a href="UserHome.jsp"> <%= new Date() %></a>
    <hr />
	<a href="ViewCategory.jsp">Place Order</a>
	<a href="OrderStatus.jsp">View Order Status</a>
	<a href="ViewBill.jsp">View Bill</a>
	<a href="LoginPage.jsp">Log Out</a>
</div>

<div class="main">
  <div class="container">
    <h1>Ordered Items</h1>
    <table class="table table-striped table-hover">
      <%
        if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
            out.write("<h3>" + GlobalConstants.MESSAGE + "</h3>");
            GlobalConstants.MESSAGE = "";
        }
        if (orders != null && orders.size() != 0) {
      %>
      <tr>
        <th>Serial Number</th>
        <th>Table Number</th>
        <th>Order ID</th>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Actual Status</th>
      </tr>
      <%
        for (int i = 0; i < orders.size(); i++) {
          OrderDetails om = orders.get(i);
      %>
      <form action="cook?action=updateItemtatus" method="post">
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
        </tr>
      </form>
      <%
        }
      } else {
      %>
      <tr>
        <td colspan="6" style="text-align: center;">No Orders Available</td>
      </tr>
      <%
      }
      %>
    </table>

    <a href="OrderStatus.jsp"><button class="btn btn-danger">Go Back</button></a>
  </div>
</div>

</body>
</html>
