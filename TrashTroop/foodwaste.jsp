<%@ page import= "java.sql.*" %>
<html>
<head>
	<title> Food-waste </title>	
        <link rel="stylesheet" href="foodwaste.css">
</head>
<body>
<center>
	<h1> Food Scheduling </h1>
    <form method="POST">
        <input type="email" name="name" placeholder="Enter email"  required/>   
        <br><br>
        <input type="text" name="phone" placeholder="Enter phone number"  required/>   
        <br><br>
	<input type="text" name="address" placeholder="Bldg /Room no"  required/>   
        <br><br>
	<label for="typee">Type</label>
        <br>
            <input type="radio" name="vnb" value="v" /> Veg
            <input type="radio" name="vnb" value="nv" />Non-Veg
            <input type="radio" name="vnb" value="both" />Both
	<br><br>
        <input type="text" name="item" placeholder="Food"  required/>
        <br><br>
        <label for="time">How old the food is?</label>
        <br>
        <input type="text" name="time" placeholder="preparing time(eg today, 10am )"  required/>
        <br><br>
        <label for="time">how many people?</label>
        <br>
        <input type="text" name="amt" placeholder="approx. "  required/>
        <br><br>
	<input type="text" name="description" placeholder="description"  />
        <br><br>
       	<input type="submit" name="btn" />
	<button type="submit" name="logout" onclick="window.location.href='mapping.jsp';">Back</button>
    </form>

	<%
		if (request.getParameter("btn")!=null)
		{
		try
		{
		Connection con= null;
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver() );
		String url="jdbc:mysql://localhost:3308/foodwaste" ;
		con = DriverManager.getConnection(url, "root", "abc123" );
		String sql = "INSERT INTO food_schedule (name, phone, item, time, amt, vnb, address, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String item = request.getParameter("item");
                String time = request.getParameter("time");
                String amt = request.getParameter("amt");
                String vnb = request.getParameter("vnb");
                String address = request.getParameter("address");
                String description = request.getParameter("description");
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, phone);
                pstmt.setString(3, item);
                pstmt.setString(4, time);
                pstmt.setString(5, amt);
                pstmt.setString(6, vnb);
                pstmt.setString(7, address);
		pstmt.setString(8, description);
                    session.setAttribute("email", name);
                pstmt.executeUpdate();  
		int rowsInserted = pstmt.executeUpdate(); 
                con.close();
                if (rowsInserted > 0) {
    		%>
                    <p class='success'>Pickup has been scheduled!!</p>
    		<%
                }
            	}
		catch(SQLException e) 
			{
                out.println("issue " + e);
            		}
       		}
    %>
</center>
</body>
</html>