<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
.abc{
	border:2px solid black;
	padding :2px;
	margin:1px 1px;
}

</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
	<%
	String a=request.getParameter("name");
	Connection con=dbutil.connect();
	final String sql="select * from books where bname like ?";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1,"%"+a+"%" );
	ResultSet rs=stmt.executeQuery();
	while(rs.next()){
	%><div class="col-sm-3 mx-auto abc">
		<img src="<%=rs.getString("path") %>" style="widht:200px; height:200px;">
		<h5>Book Name:<%=rs.getString("bname") %></h5>
		<h5>Book Quantity:<%=rs.getString("qty") %></h5>
		</div>
	<%
	}
	con.close();
	%>
	</div>
</div>	
</body>
</html>