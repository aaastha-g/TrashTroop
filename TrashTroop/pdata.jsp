<%@ page import="java.sql.*" %>
<html>
<head>
    <title>E-waste Data</title>
    <link rel="stylesheet" href="edata.css">
</head>
<body>
<center>
    <h1>Plastic waste Data</h1>
    <div class="container">
        <form method="POST">
            <table>
                <tr>
                    <th>Select</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Item</th>
                    <th>Day</th>
                </tr>
                <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3308/plastics";
                        String username = "root";
                        String password = "abc123";

                        try (Connection con = DriverManager.getConnection(url, username, password)) {
                            String sql = "SELECT * FROM items";
                            try (PreparedStatement pst = con.prepareStatement(sql)) {
                                try (ResultSet rs = pst.executeQuery()) {
                                    while (rs.next()) {
                                        String id = rs.getString("id");
                                        String name = rs.getString("name");
                                        String phone = rs.getString("phone");
                                        String item = rs.getString("item");
                                        String day = rs.getString("day");
                %>
                <tr>
                    <td><input type="checkbox" name="deleteIds" value="<%= id %>"></td>
                    <td><%= name %></td>
                    <td><%= phone %></td>
                    <td><%= item %></td>
                    <td><%= day %></td>
                </tr>
                <%
                                    }
                                }
                            }
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        out.println("Error: " + e);
                    }
                %>
            </table>
            <br>
            <input type="submit" name="btnDelete" value="Delete Selected Data">
        </form>
        <%
            if (request.getParameter("btnDelete") != null) {
                String[] deleteIds = request.getParameterValues("deleteIds");
                if (deleteIds != null && deleteIds.length > 0) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3308/plastics";
                        String username = "root";
                        String password = "abc123";

                        try (Connection con = DriverManager.getConnection(url, username, password)) {
                            String sql = "DELETE FROM items WHERE id = ?";
                            try (PreparedStatement pst = con.prepareStatement(sql)) {
                                for (String id : deleteIds) {
                                    pst.setString(1, id);
                                    pst.executeUpdate();
                                }
                            }
                        }
                        out.println("<p class='success'>Selected data deleted successfully!</p>");
                        out.println("<div class='gif-container'>");
                        out.println("<img src='deliveryGIF.gif' alt='Deleting data' class='gif'>");
                        out.println("</div>");
                    } catch (ClassNotFoundException | SQLException e) {
                        out.println("Error: " + e);
                    }
                }
            }
        %>
    </div>
</center>
</body>
</html>
