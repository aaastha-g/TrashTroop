<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin page for Waste Management</title>
    <link rel="stylesheet" href="adminlogin.css">
</head>
<body>
<div class="contain">
    <div class="text">
        <center>
            <h1>Admin Login</h1>
            <form id="login_form" method="post">
                <input class="inp1" type="text" name="un" placeholder="Enter Username" required><br><br>
                <input class="inp2" type="password" name="pw" placeholder="Enter Password" required><br><br>
                <input class="btn" type="submit" name="btn" value="Login" />
            </form>
        </center>
     

        <% 
            if(request.getParameter("btn") != null) {
                String un = request.getParameter("un");
                String pw = request.getParameter("pw");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3308/admin";
                    String dbUsername = "root";
                    String dbPassword = "abc123";
                    try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                        String sql = "SELECT * FROM users WHERE un=? AND pw=MD5(?)";
                        try(PreparedStatement pst = con.prepareStatement(sql)) {
                            pst.setString(1,un);
                            pst.setString(2,pw);
                            try(ResultSet rs = pst.executeQuery()) {
                                if(rs.next()) {
                                    String authenticatedUser = rs.getString("un");
                                    session.setAttribute("un", authenticatedUser);
                                    response.sendRedirect("adminpg.jsp");
                                } else {
                                    out.println("<b><p class='error'>Check your USER ID or PASSWORD again!!</p></b>");
                                }
                            }
                        }
                    }
                } catch(Exception e) {
                    out.println("<b><p class='error'>An error occurred: " + e.getMessage() + "</p></b>");
                }
            }
        %>
    </div>
</div>
</body>
</html>
