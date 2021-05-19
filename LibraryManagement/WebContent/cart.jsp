<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<jsp:include page="sheader.jsp"></jsp:include>
<div class="container-fluid">
	<table class="table table-bordered table-stripped">
	<thead>
		<tr>
			<th>Book Id</th>
			<th>Book Name</th>
			<th>Date</th>
		</tr>
	</thead>
	<tbody>
	<%
	String a=request.getParameter("name");
	Connection con=dbutil.connect();
	final String sql="select * from issuebook where uname=?";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1,session.getAttribute("uname").toString());
	ResultSet rs=stmt.executeQuery();
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("bid") %></td>
		<td><%=dbutil.name(rs.getString("bid")) %></td>
		<td><%=rs.getString("Date") %></td>
	</tr>
	<%
	}
	con.close();
	%>
	</tbody>
	</table>
</div>	
<jsp:include page="sfooter.jsp"></jsp:include>