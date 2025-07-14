<%@ page import= "java.sql.*" %>
<html>
<head>
	<title> E-waste </title>
	<link rel="stylesheet" href="ewaste.css">
	
</head>
<body>
<center>
	<h1> Scheduling Ewaste </h1>
	<form method="POST">
		<input type="text" name="name" placeholder="Enter name"  required/>	
		<br><br>
		<input type="text" name="phone" placeholder="Enter phone number"  required/>	
		<br><br>
		<input type="text" name="item" placeholder="Product to be collected"  required/>
		<br><br>
		<label for="datepicker">Select Pickup Date [time:9am]</label>
		<br>
       		<input type="radio" name="day" value="Saturday" /> Saturday
        	<br><br>
       		<input type="radio" name="day" value="Monday" />Monday
        	<br><br>
       		<input type="radio" name="day" value="Wednesday" />Wednesday
        	<br><br>
		<input type="submit" name="btn" /><br><br>
		<button type="submit" name="logout" onclick="window.location.href='mapping.jsp';">Back</button>
	</form>
	<%
		if (request.getParameter("btn")!=null)
		{
		try
		{
		Connection con= null;
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver() );
		String url="jdbc:mysql://localhost:3308/ewastes" ;
		con = DriverManager.getConnection(url, "root", "abc123" );
		String sql="INSERT INTO items (name, phone, item, day) VALUES (?, ?, ?, ?)";
		PreparedStatement pst= con.prepareStatement(sql);
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String item = request.getParameter("item");
		String day = request.getParameter("day");
		pst.setString(1,name);
		pst.setString(2,phone);
		pst.setString(3,item);
		pst.setString(4, day);
		pst.executeUpdate();
		out.println("<p class='success'>Pickup has been scheduled!!</p>");
		con.close();
		}
		catch(SQLException e)
		{
			out.println("issue "+e);
		}
		}
	%>
</center>
</body>
</html>