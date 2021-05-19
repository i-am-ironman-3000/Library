<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<jsp:include page="adminheader.jsp"/>
<div class="row">
	<div class="col-sm-5 mx-auto text-center">
		<form method="post" action="EditCat">
		<%
		Connection con=dbutil.connect();
		String catid=request.getParameter("catid");
		final String sql="select * from catogery where catid=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, catid);
		ResultSet rs=ps.executeQuery();
		rs.next();
		%>
			<div class="form-group">
				<input type="text" class="form-control" value="<%=rs.getString("cname")%>" name="cname">
			</div>
			<input type="text" hidden value="<%=catid %>" name="catid">
			<input type="submit" class="btn btn-primary mt-3 btn-sm" value="Edit">
		<%
		con.close();
		%>
		</form>
	</div>
</div>
<jsp:include page="adminfooter.jsp"/>