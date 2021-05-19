<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<jsp:include page="sheader.jsp"/>
<div class="container">
	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
		<%
		Connection con=dbutil.connect();
		final String sql="select * from notification where uname=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, session.getAttribute("uname").toString());
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString("notifi") %></td>
		</tr>
		<%}
		con.close();%>
		</tbody>
	</table>
</div>
<jsp:include page="sfooter.jsp"/>