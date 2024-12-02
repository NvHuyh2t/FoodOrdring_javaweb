<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hotel Ordering System</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
             background: url('assets/images/res.jpg') no-repeat center center fixed;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        /* Navbar */
        .navbar {
            
            padding: 10px 20px;
             height: 46px;
    background-color: rgba(0, 0, 9, 0.5);
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1;list-style-type: none;
    
}
.navbar  li {
     display: inline-block;
    position: relative;
    
} 
.navbar-nav nav-item{
     display: inline-block;
    position: relative;
    background: red;
    
} 


        .navbar-nav .nav-link {
            color: #ecf0f1 !important;
            font-size: 16px;
            margin: 0 10px;
        }

        .navbar-nav .nav-link:hover {
            color: #3498db !important;
        }

        /* Main Content */
        .container {
            margin-top: 40px;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: pink ;
            text-align: center;
        }
        h3{
            color: palevioletred;
        }

        p {
            font-size: 18px;
            color: #7f8c8d;
            margin-bottom: 40px;
            text-align: center;
        }

        /* Logo */
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo img {
            width: 180px; /* Increased logo size */
            height: auto;
        }

        /* Card container for Cook and Table login in the same row */
        .row {
            display: flex;
            justify-content: space-around; /* Ensures even distribution of space */
            gap: 20px;
            margin-top: 40px;
        }

        .col-12 {
            flex: 1;
        }

        .loginCard {
            text-align: center;
            padding: 20px;
            background-color: rgba(0, 0, 9, 0.5);
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px;
        }

        .loginCard img {
            width: 100%;
            max-width: 300px;
            height: auto;
            border-radius: 10px;
        }

        .loginCard:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .row {
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }

            .navbar-nav {
                text-align: center;
            }

            /* Stack the cards on smaller screens */
            .loginCard {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    
    <nav class="navbar navbar-expand-sm">
        <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link disabled">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="LoginPage.jsp">Cook Login</a></li>
            <li class="nav-item"><a class="nav-link" href="LoginPage.jsp">Table Login</a></li>
            <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact Us</a></li>
        </ul>
<!--        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact Us</a></li>
        </ul>-->
    </nav>

    <div class="container">
        <div class="logo">
            <img src="assets/images/huy.jpg" alt="Logo" />
            <h1>Welcome to the best restaurant VietNam</h1>
            <p>Your satisfaction is our priority. Choose your role to start.</p>
        </div>

        <div class="row">
            <div class="col-12 col-md-6">
                <h3>Cook Login</h3>
                <div class="loginCard">
                    <a href="LoginPage.jsp"><img src="assets/images/cookduc.jpg" alt="Cook Login"></a>
                </div>
            </div>

            <div class="col-12 col-md-6">
                <h3>Table Login</h3>
                <div class="loginCard">
                    <a href="LoginPage.jsp"><img src="assets/images/res.jpg" alt="Table Login"></a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
