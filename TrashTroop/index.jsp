<%@ page import="java.sql.*" %>
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page for Waste Management</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>

<div class="video-container">
    <video autoplay loop muted>
        <source src="index_bg_vid.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</div>

<div class="contain">
    <div class="text">
        <center>
        <h1>Login</h1>
        <form id="login_form"  method="post">
            <input class="inp1" type="text" name="un" placeholder="Enter Username" required><br><br>
            <input class="inp2" type="password" name="pw" placeholder="Enter Password" required><br><br>
            <input class="btn" type="submit" name="btn" value="Login" />
        </form>
        <p>Not a member?</p>
        <p><span><a href="signup.jsp"> Sign up </a></span></p>
    </center>
        <% 
            String u = (String)session.getAttribute("un");
            if(u != null) {
                response.sendRedirect("dashboard.jsp");
            }
        %>
    </div>

    <% 
        if(request.getParameter("btn") != null) {
            String un = request.getParameter("un");
            String pw = request.getParameter("pw");
            try {
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                String url = "jdbc:mysql://localhost:3308/loginpage";
                Connection con = DriverManager.getConnection(url, "root", "abc123");
                String sql = "select * from users where un=? and pw=md5(?) ";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1,un);
                pst.setString(2,pw);
                ResultSet rs = pst.executeQuery();
                if(rs.next()) {
                    String authenticatedUser = rs.getString("un");
                    session.setAttribute("un", authenticatedUser);
                    response.sendRedirect("dashboard.jsp");
                } else {
         
                    out.println("<b><p class='success'>Check your USER ID or PASSWORD again!!</p></b>");
                }
                con.close();
            } catch(SQLException e) {
                out.println("issue=" + e);
            }
        }
    %>   
</div>

</body>
</html>