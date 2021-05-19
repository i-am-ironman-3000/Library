<%@page import="library.dbutil"%>
<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<jsp:include page="adminheader.jsp"/>
<h4>Catogery</h4>
<div class="row">
	<div class="col-sm-6">
		<table class="table table-borderd table-striped">
			<thead class="table-dark">
				<tr>
					<th>Catogery Id</th>
					<th>Catogary Name</th>
					<th>Operations</th>
				</tr>
			</thead>
			<tbody>
				<%
				Connection con=dbutil.connect();
				String sql="select * from catogery";
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
				%>
					<tr>
						<td><%= rs.getString("catid") %></td>
						<td><%= rs.getString("cname") %></td>
						<td>
						<a href="editcat.jsp?catid=<%=rs.getString("catid") %>" class="btn btn-sm btn-primary">Edit</a>
						<a href="deletecat?catid=<%=rs.getString("catid") %>" class="btn btn-sm btn-danger">Delete</a>
						</td>
					</tr>
				<%}
				con.close();
				%>
			</tbody>
		</table>
	</div>
	<div class="col-sm-6">
		<form method="post" action="addcat">
			<div class="form-group">
				<input type="text" name="cname" class="form-control">
			</div>
			<input type="submit" value="Add Catogery" class="btn btn-dark text-white btn-block">
			<%
			if(session.getAttribute("msg")!=null){
			%>
			<div class="clearfix"></div>
			<div class="alert alert-danger text-center font-weight-bold mt-3">
							<%=session.getAttribute("msg") %>
			</div>
			<%}
			session.removeAttribute("msg");
			%>
		</form>
	</div>
</div>
<jsp:include page="adminfooter.jsp"/>