<%@ page import= "java.sql.*" %>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp page for Waste Management</title>
    <link rel="stylesheet" href="signup.css">
    <style>
        /* Add the modified CSS here */
        .video-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .bg-video {
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
<div class="contain">
    <div class="video-container">
        <video autoplay loop muted class="bg-video">
            <source src="index_bg_vid.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>
    <div class="text">
        <h1>Signup</h1>
        <a href="index.jsp"> Already registered?</a>
        <form method="post">
            <input type="text" name="un" placeholder="Enter Username" required><br><br>
            <input type="password" name="pw1" placeholder="Enter Password" required><br><br>
            <input type="password" name="pw2" placeholder="Confirm Password" required><br><br><br><br>
            <input type="submit" name="btn" value="Signin"/><br>
        </form>
        <% 
        String u=(String)session.getAttribute("un");
        if(u!=null)
        {
            response.sendRedirect("index.jsp");
        }
        %>
    </div>

    <%
        if(request.getParameter("btn")!=null )
        {
            String un = request.getParameter("un");
            String pw1 = request.getParameter("pw1");
            String pw2 = request.getParameter("pw2");
            if(pw1.equals(pw2))
            {
            try {
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                String url = "jdbc:mysql://localhost:3308/loginpage";
                Connection con = DriverManager.getConnection(url, "root", "abc123");
                String sql = "INSERT INTO users (un, pw) VALUES (?, MD5(?))";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, un);
                pst.setString(2, pw1);
                
                int rowsAffected = pst.executeUpdate();
                if (rowsAffected > 0) {
                    // Signup successful, redirect to dashboard
                    response.sendRedirect("index.jsp");
                } else {
                    out.println("Signup failed: No rows affected");
                }
                
                con.close();
            } catch (SQLException e) {
                out.println("Signup failed: " + e.getMessage());
            }
        } else {
            out.println("Passwords did not match!!");
        }
    }
    %>
</div>
</body>
</html>
