<%@ page import= "java.sql.*" %>
<%
    String un = (String)session.getAttribute("un");
    if (un == null) {
        response.sendRedirect("index.jsp");
    } else 
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" /></head>

    <!-- <link rel="stylesheet" href="dashboard.css"> -->
</head>
<body>
    <header>
        <nav>
            <ul class='nav-bar'>
                <li class='logo'><a href='dashboard.jsp'><img src='logoNAV.jpg'/></a></li>
                <input type='checkbox' id='check' />
                <span class="menu">
                    <li><a href="dashboard.jsp">Home</a></li>
                    <li><a href="CFPgpt.jsp">CFP</a></li>
                    <li><a href="protocols.jsp">Protocols</a></li>
                    <li><a href="mapping.jsp">Scheduling</a></li>
                    <li><a href="adminlogin.jsp">Admin</a></li>
                    <li><a href="#footer">Contact</a></li>
                    <label for="check" class="close-menu"><i class="fas fa-times"></i></label>
                </span>
                <label for="check" class="open-menu"><i class="fas fa-bars"></i></label>
            </ul>
        </nav>
    </header>
	
    		
    <div>
        <section class="section" id="sec1">
            <div class="innerdiv"></div>
            <h1>Hi <%= un %>,</h1>
            <p id="one">Over 160000 metric tones of Waste is Generated Daily in India.</p>
            <!-- <p id="two"><a href="#sec3">Want to learn waste separation techniques?</a></p>
            <p id="three"><a href="#sec2">THEN WHAT SHOULD WE DO??</a></p> -->
        </section>
        
        <section class="section" id="sec3">
            <div class="innerdiv"></div>
            <h1>Learn waste disposal techniques at home</h1>
            <button class="btn btn1">Learn</button>
        </section>
        <section class="section" id="sec4">
            <div class="innerdiv"></div>
            <h1>Schedule Waste Disposals</h1>
            <button class="btn btn1" onclick="location.href='./mapping.jsp'">Visit </button>
        </section>
        <section class="section" id="sec5">
            <div class="innerdiv"></div>
            <h1>Check Carbon Footprints</h1>
            <!-- <img src="/logos/WA.png" id="logo"> -->
        </section>
        <section class="section" id="sec5">
            <div class="innerdiv"></div>
            <h2>Sec1</h2>
            <!-- <img src="/logos/WA.png" id="logo"> -->
        </section>
    </div>
    <footer class="footer" id="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col">
                    <h4>company</h4>
                    <ul>
                        <li><a href="#">about us</a></li>
                        <li><a href="#">our services</a></li>
                        <li><a href="#">privacy policy</a></li>
                        <li><a href="#">affiliate program</a></li>
                    </ul>
                </div>
                <!-- <div class="footer-col">
                    <h4>get help</h4>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">shipping</a></li>
                        <li><a href="#">returns</a></li>
                        <li><a href="#">order status</a></li>
                        <li><a href="#">payment options</a></li>
                    </ul>
                </div> -->
                <!-- <div class="footer-col">
                    <h4>online shop</h4>
                    <ul>
                        <li><a href="#">watch</a></li>
                        <li><a href="#">bag</a></li>
                        <li><a href="#">shoes</a></li>
                        <li><a href="#">dress</a></li>
                    </ul>
                </div> -->
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                        <a href="https://www.instagram.com/aaastha_g_?igsh=MWR1a3N5MDNpdzgxdg==" target="_blank"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://www.instagram.com/tkim0495?igsh=MWxmdHdkMDhnZjl1Mw==" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="https://www.instagram.com/chin28may?igsh=MTVocTJ3ZjhqMTFzdw==" target="_blank"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.instagram.com/chin28may?igsh=MTVocTJ3ZjhqMTFzdw==" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
   </footer>
</body>
</html>