<%@ page import="constants.GlobalConstants" %>
<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires", "0"); // Prevents caching
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <style>
        /* Navbar styles */
        .navbar {
            background-color: #2c3e50;
            padding: 15px 30px;
        }

        .navbar-nav {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .navbar-nav .nav-item {
            display: inline;
            margin-right: 30px;
        }

        .navbar-nav .nav-link {
            color: #ecf0f1;
            text-decoration: none;
            font-size: 18px;
        }

        .navbar-nav .nav-link:hover {
            color: #3498db;
        }

        /* Page container */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 0;
        }

        .container {
            margin-top: 70px;
            max-width: 600px;
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            margin-left: auto;
            margin-right: auto;
        }

        h1 {
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 30px;
        }

        img {
            border-radius: 10px;
            margin-bottom: 30px;
        }

        /* Form styles */
        .form-group label {
            font-weight: bold;
            color: #34495e;
        }

        .form-control {
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            padding: 12px;
            font-size: 18px;
            width: 100%;
            margin-bottom: 20px;
        }

        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
        }

        .btn-primary {
            background-color: #3498db;
            border-color: #2980b9;
            color: #fff;
            font-size: 18px;
            font-weight: bold;
            padding: 12px 25px;
            border-radius: 5px;
            width: 100%;
            margin-top: 20px;
        }

        .btn-primary:hover {
            background-color: #2980b9;
        }

        /* Message styles */
        h3 {
            color: #e74c3c;
            font-size: 18px;
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="Home.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled">Cook Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled">Table Login</a>
            </li>
        </ul>
        <ul class="navbar-nav" style="float: right;">
            <li class="nav-item">
                <a class="nav-link" href="ContactUs.jsp">Contact Us</a>
            </li>
        </ul>
    </nav>

    <!-- Login Container -->
    <div class="container">
        <center>
            <img src="assets/images/huy.jpg" alt="Logo" style="width: 120px; height: auto;" />
            <h1>Login Page</h1>
        </center>

        <!-- Login Form -->
        <form action="control?action=login" method="post">
            <% if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) { %>
            <h3><%= GlobalConstants.MESSAGE %></h3>
            <% GlobalConstants.MESSAGE = ""; } %>
            <div class="form-group">
                <label for="username">User Name:</label>
                <input type="text" class="form-control" name="userName" id="userName" placeholder="Enter your username" required />
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" name="pass" id="pass" placeholder="Enter your password" required />
            </div>
            <button type="submit" class="btn-primary">Login</button>
        </form>
    </div>
</body>

</html>
