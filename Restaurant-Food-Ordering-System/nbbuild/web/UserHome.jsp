<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Date"%>
<%@page import="constants.GlobalConstants"%>
<%@page import="Model.Login"%>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
Login login = (Login) session.getAttribute(GlobalConstants.USER);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hotel Ordering System</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        h4, h2 {
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
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

        .sidenav-header {
            font-size: 24px;
            font-weight: bold;
            color: #f1c40f;
            text-align: center;
        }

        .sidenav-date {
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
            color: #bdc3c7;
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
            background-color: #f1c40f;
            color: #2c3e50;
        }

        /* Main Content */
        .main {
            margin-left: 270px;
            padding: 20px;
        }

        .container {
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Slideshow */
        .slideshow-container {
            position: relative;
            max-width: 100%;
            margin: 20px auto;
            overflow: hidden;
            border-radius: 10px;
        }

        .slide-image {
            width: 100%;
            display: block;
            border-radius: 10px;
        }

        .mySlides .text {
            position: absolute;
            bottom: 10%;
            left: 50%;
            transform: translateX(-50%);
            background-color: rgba(0, 0, 0, 0.6);
            color: #fff;
            padding: 10px 15px;
            font-size: 18px;
            border-radius: 5px;
            text-align: center;
        }

        /* Dots */
        .dots-container {
            text-align: center;
            margin-top: 10px;
        }

        .dot {
            height: 12px;
            width: 12px;
            margin: 0 5px;
            background-color: #ccc;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.3s;
        }

        .dot:hover, .dot.active {
            background-color: #2c3e50;
        }
    </style>
</head>
<body>
<div class="sidenav">
    <h4 class="sidenav-header">Huy's Restaurant</h4>
    <p class="sidenav-date"><%= new Date() %></p>
    <hr />
    <% if (login.getUserName().equals("cook")) { %>
        <a href="AddCategory.jsp">Add Category</a>
        <a href="AddItem.jsp">Add Item</a>
        <a href="ViewOrder.jsp">View Order</a>
        <a href="ViewBillToCook.jsp">View Bill</a>
        <a href="LoginPage.jsp">Log Out</a>
    <% } else { %>
        <a href="ViewCategory.jsp">Place Order</a>
        <a href="OrderStatus.jsp">View Order Status</a>
        <a href="ViewBill.jsp">View Bill</a>
        <a href="LoginPage.jsp">Log Out</a>
    <% } %>
</div>

<div class="main">
    <div class="container">
        <div class="slideshow-container">
            <div class="mySlides fade">
                <img src="assets/images/restaurant.png" alt="Ambience" class="slide-image" />
                <div class="text">Ambience</div>
            </div>
            <div class="mySlides fade">
                <img src="assets/images/food.png" alt="Food" class="slide-image" />
                <div class="text">Food</div>
            </div>
            <div class="mySlides fade">
                <img src="assets/images/bevereges.jpg" alt="Beverages" class="slide-image" />
                <div class="text">Beverages</div>
            </div>
        </div>
        <div class="dots-container">
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
        <% if (login.getUserName().equals("cook")) { %>
            <h2>Welcome back, <%= login.getUserName() %>!</h2>
        <% } else { %>
            <h2>Welcome to Huy's Restaurant, Table <%= login.getUserName() %>!</h2>
        <% } %>
    </div>
</div>
<script>
    // Example slideshow script
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) slideIndex = 1;
        for (let i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 3000); // Change image every 3 seconds
    }
</script>
</body>
</html>
