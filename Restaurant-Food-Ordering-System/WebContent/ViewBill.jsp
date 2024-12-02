<%@page import="java.util.Date"%>
<%@page import="Model.Login"%>
<%@page import="Model.BillDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UserService"%>
<%@page import="constants.GlobalConstants"%>
<%
	UserService uService = new UserService();
	Login login = (Login) session.getAttribute(GlobalConstants.USER);
	ArrayList<BillDetails> bDetails = uService.getBill(Integer.parseInt(login.getUserName()));
	
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader ("Expires", "0"); 
%>
<!DOCTYPE html>
<html>
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
                        background: url('assets/images/res.jpg') no-repeat center center fixed;
			background-color: #f9f9f9;
			color: #333;
			line-height: 1.6;
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
			overflow-y: auto;
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
			background: #fff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}

		h1 {
			text-align: center;
			margin-bottom: 20px;
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
		}

		td {
			padding: 10px;
			text-align: left;
		}

		tr:nth-child(even) {
			background-color: #f2f2f2;
		}

		tr:hover {
			background-color: #ddd;
		}

		td b {
			color: #007bff;
		}
	</style>
</head>
<body>
<div class="sidenav">
	<a href="UserHome.jsp"> <%= new Date() %> </a>
	<hr />
	<a href="ViewCategory.jsp">Place Order</a>
	<a href="OrderStatus.jsp">View Order Status</a>
	<a href="ViewBill.jsp">View Bill</a>
	<a href="LoginPage.jsp">Log Out</a>
</div>

<div class="main">
	<div class="container">
		<h1>View Bill</h1>
		
		<%
		if (bDetails != null && !bDetails.isEmpty()) {
		%>
		<table>
			<%
			if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
				out.write("<h3>" + GlobalConstants.MESSAGE + "</h3>");
				GlobalConstants.MESSAGE = "";
			}
			%>
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
			for (int i = 0; i < bDetails.size(); i++) {
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
					<% total += Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt(); %>
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
		<p>No bills available.</p>
		<%
		}
		%>
	</div>
</div>
</body>
</html>
