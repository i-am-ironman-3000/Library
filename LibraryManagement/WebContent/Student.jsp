<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="adminheader.jsp"></jsp:include>
<div class="container">
<h2 style="text-align:center" class="m-3">All Students List</h2>
<table class=" table table-bordered table-striped">
		<thead class="table-dark">
			<tr>
				<th>Name</th>
				<th>Gender</th>
				<th>Pic</th>
				
			</tr>
		</thead>
		<tbody>
			<%
			Connection con=dbutil.connect();
			final String sql="select * from student";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){%>
				<tr>
				   <td><%= rs.getString("name")%></td>
				   <td><%= rs.getString("gender")%></td>
				
				 <td><img src="<%=rs.getString("pic") %>" style="width:100px;height:100px;">
			        </td>
				
			<%} %>
		</tbody>
		</table>
</div>

<jsp:include page="adminfooter.jsp"></jsp:include>
