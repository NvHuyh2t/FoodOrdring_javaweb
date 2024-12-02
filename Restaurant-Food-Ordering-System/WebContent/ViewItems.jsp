<%@page import="java.util.Date"%>
<%@page import="Model.Login"%>
<%@page import="Model.OrderMaster"%>
<%@page import="Model.Item"%>
<%@page import="Model.Category"%>
<%@page import="DAO.UserService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="constants.GlobalConstants"%>
<%
	ArrayList<Item> cats = null;
	Login login = (Login) session.getAttribute(GlobalConstants.USER); 
	if (request.getParameter("catId") != null)
		cats = new UserService().getAllItems(Integer.parseInt(request.getParameter("catId")));
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader ("Expires", "0"); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Items</title>
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

		.form-control {
			width: 100%;
			padding: 10px;
			margin-top: 5px;
			border: 1px solid #ccc;
			border-radius: 5px;
		}

		.form-group {
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
<div class="sidenav">
    <a href="UserHome.jsp"><%= new Date() %></a>
    <hr />
	<a href="ViewCategory.jsp">Place Order</a>
	<a href="OrderStatus.jsp">View Order Status</a>
	<a href="ViewBill.jsp">View Bill</a>
	<a href="LoginPage.jsp">Log Out</a>
</div>

<div class="main">
	<div class="container">
		<h1>Category Items</h1>

		<%
		if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
			out.write("<h3>" + GlobalConstants.MESSAGE + "</h3>");
			GlobalConstants.MESSAGE = "";
		}
		%>

		<form action="cook?action=makeOrder" method="post">
			<table>
				<tr>
					<th>Serial Number</th>
					<th>Name</th>
					<th>Quantity</th>
					<th>Cost</th>
					<th>Order Quantity</th>
					<th>Action</th>
				</tr>
				<%
				if (cats != null && cats.size() != 0) {
					for (int i = 0; i < cats.size(); i++) {
						Item cat = cats.get(i);
				%>
				<tr>
					<td><%= i + 1 %></td>
					<input type="hidden" name="catId" value="<%= request.getParameter("catId") %>" />
					<input type="hidden" name="status" value="<%= OrderMaster.OrderStatus.JUST_ORDERED.name() %>" />
					<td><%= cat.getItemName() %></td>
					<td><%= cat.getQnt() %></td>
					<td><%= cat.getCost() %></td>
					<td><input type="number" name="orderQnt" value="0" class="form-control" /></td>
					<td><input type="checkbox" name="ItemId" value="<%= cat.getId() %>" /></td>
				</tr>
				<%
					}
				}
				%>
			</table>

			<br />
			<div class="form-group">
				<label for="orderName">Order Name:</label>
				<input type="text" class="form-control" name="orderName" id="orderName" />
				<input type="hidden" name="tableNo" value="<%= Integer.parseInt(login.getUserName()) %>" />
			</div>

			<button type="submit" class="btn btn-primary">Order Now!</button>
		</form>
		<br />
		<a href="ViewCategory.jsp"><button class="btn btn-danger">Go Back</button></a>
	</div>
</div>
</body>
</html>
