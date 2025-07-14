<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<html>
<head>
    <title>Food Data</title>
    <link rel="stylesheet" href="edata.css">
</head>
<body>
<center>
<%
    String un = (String)session.getAttribute("un");
    if (un == null) {
        response.sendRedirect("index.jsp");
    } else 
%>
    <h1>Food Data</h1>
    <div class="container">
        <form method="POST">
            <table>
                <tr>
                    <th>Select</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Item</th>
                    <th>Time</th>
                    <th>Amount</th>
                    <th>VNB</th>
                    <th>Address</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
			<button type="submit" name="logout" onclick="window.location.href='adminpg.jsp';">Back</button>
                <% 
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String url = "jdbc:mysql://localhost:3308/foodwaste";
                        String username = "root";
                        String password = "abc123";

                        try (Connection con = DriverManager.getConnection(url, username, password)) {
                            String sql = "SELECT * FROM food_schedule";
                            try (PreparedStatement pst = con.prepareStatement(sql)) {
                                try (ResultSet rs = pst.executeQuery()) {
                                    while (rs.next()) {
                                        String id = rs.getString("id");
                                        String name = rs.getString("name");
                                        String phone = rs.getString("phone");
                                        String item = rs.getString("item");
                                        String time = rs.getString("time");
                                        String amt = rs.getString("amt");
                                        String vnb = rs.getString("vnb");
                                        String address = rs.getString("address");
                                        String description = rs.getString("description");
                %>
                <tr>
                    <td><input type="checkbox" name="deleteIds" value="<%= id %>"></td>
                    <td><%= un %></td>
                    <td><%= phone %></td>
                    <td><%= item %></td>
                    <td><%= time %></td>
                    <td><%= amt %></td>
                    <td><%= vnb %></td>
                    <td><%= address %></td>
                    <td><%= description %></td>
                    <td>
                        <button type="submit" name="btnAccept_" value="<%= id %>" class="accept-btn"></button>
                        <button type="submit" name="btnReject_" value="<%= id %>" class="reject-btn"></button>
                    </td>
                </tr>
                <%
                                    }
                                }
                            }
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        out.println("Error: " + e);
                    } finally {
                        // Add the finally block here
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
                        String url = "jdbc:mysql://localhost:3308/foodwaste";
                        String username = "root";
                        String password = "abc123";

                        try (Connection con = DriverManager.getConnection(url, username, password)) {
                            String sql = "DELETE FROM food_schedule WHERE id = ?";
                            try (PreparedStatement pst = con.prepareStatement(sql)) {
                                for (String id : deleteIds) {
                                    pst.setString(1, id);
                                    pst.executeUpdate();
                                }
                            }
                        }
                        out.println("<p class='success'>Selected data deleted successfully!</p>");
                    } catch (ClassNotFoundException | SQLException e) {
                        out.println("Error: " + e);
                    }
                }
            }
        %>
        <%
        if (request.getParameter("btnAccept_") != null) {
            String email = (String)session.getAttribute("email");

            try {
                Properties p = System.getProperties();
                p.put("mail.smtp.host", "smtp.gmail.com");
                p.put("mail.smtp.port", 587);
                p.put("mail.smtp.auth", true);
                p.put("mail.smtp.starttls.enable", true);

                javax.mail.Session ms = javax.mail.Session.getInstance(p, new Authenticator() {
                    public PasswordAuthentication getPasswordAuthentication() {
                        String un = "aasthatester27@gmail.com";
                        String pw = "zatcnzxynmljakpu";
                        return new PasswordAuthentication(un, pw);
                    }
                });

                try {
                    MimeMessage msg = new MimeMessage(ms); // Initialize the MimeMessage object
                    String subject = "Email from NGO";
                    msg.setSubject(subject);
                    String txt = "Your request is accepted";
                    msg.setText(txt);
                    msg.setFrom(new InternetAddress("aasthatester27@gmail.com"));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    Transport.send(msg);
                    out.println("<p class='success'>Email sent successfully!</p>");
                } catch (Exception e) {
                    out.println("Issue: " + e);
                }
            } catch (Exception e) {
                out.println("Issue: " + e);
            }
        } else if (request.getParameter("btnReject_") != null) {
            String email = (String)session.getAttribute("email");

            try {
                Properties p = System.getProperties();
                p.put("mail.smtp.host", "smtp.gmail.com");
                p.put("mail.smtp.port", 587);
                p.put("mail.smtp.auth", true);
                p.put("mail.smtp.starttls.enable", true);

                javax.mail.Session ms = javax.mail.Session.getInstance(p, new Authenticator() {
                    public PasswordAuthentication getPasswordAuthentication() {
                        String un = "aasthatester27@gmail.com";
                        String pw = "zatcnzxynmljakpu";
                        return new PasswordAuthentication(un, pw);
                    }
                });

                try {
                    MimeMessage msg = new MimeMessage(ms); // Initialize the MimeMessage object
                    String subject = "Email from NGO";
                    msg.setSubject(subject);
                    String txt = "Sorry your request is denied";
                    msg.setText(txt);
                    msg.setFrom(new InternetAddress("aasthatester27@gmail.com"));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    Transport.send(msg);
                    out.println("<p class='success'>Email sent successfully!</p>");
                } catch (Exception e) {
                    out.println("Issue: " + e);
                }
            } catch (Exception e) {
                out.println("Issue: " + e);
            }
        }
        %>
    </div>
</center>
</body>
</html>
