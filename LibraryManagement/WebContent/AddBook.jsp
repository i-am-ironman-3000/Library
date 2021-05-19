<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<jsp:include page="adminheader.jsp"/>
<%
if(session.getAttribute("msg")!=null){
%>
<div class="alert alert-danger">
<%=session.getAttribute("msg") %>
</div>
<%
session.removeAttribute("msg");
}
%>
<h4>Add Book</h4>
<div class="row">
	<div class="col-sm-8 mx-auto">
		<form method="post" enctype="multipart/form-data" action="addbook">
			<div class="form-group">
				<select class="form-control" name="catid">
				<option>-- Select Catogery --</option>
				<%
					Connection con=dbutil.connect();
					final String sql="select * from catogery";
					ResultSet rs=con.createStatement().executeQuery(sql);
					while(rs.next()){
					%>
						<option value="<%=rs.getString("catid") %>"><%= rs.getString("cname") %></option>
					<%
					}
					con.close();
				%>
			</select>
			</div>
			<div class="form-group">
				<label>Book Name</label>
				<input type="text" name="bname" class="form-control">
			</div>
			<div class="form-group">
				<label>Book Price</label>
				<input type="text" name="price" class="form-control">
			</div>
			<div class="form-group">
				<label>Book Quantity</label>
				<input type="text" name="qty" class="form-control">
			</div>
			<div class="form-group">
				<label>Book Image</label>
				<input type="file" accept=".jpg,.png,.jpeg" name="file" class="form-control">
			</div>
			<input type="submit" value="Add Book" class="btn btn-dark text-white text-center btn-block">
		</form>
	</div>
</div>
<jsp:include page="adminfooter.jsp"/>