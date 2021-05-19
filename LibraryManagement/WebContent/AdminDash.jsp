<%@page import="library.dbutil"%>
<jsp:include page="adminheader.jsp"/>
<div class="container">
<h2>DashBoard</h2>
</div>
		<%
		if(session.getAttribute("msg")!=null){
		%>
		<div class="alert alert-danger text-center font-weight-bold">
		 <%= session.getAttribute("msg") %>
		</div>
		<% 
		 session.removeAttribute("msg");
		 }
		%>
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>books</th>
				<th>Catogery</th>
				<th>Student</th>
				<th>IssueBook</th>
				<th>fine</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=dbutil.count("books") %></td>
				<td><%=dbutil.count("catogery") %></td>
				<td><%=dbutil.count("student") %></td>
				<td><%=dbutil.count("issuebook") %>
				<td><%=dbutil.sum() %></td>
			</tr>
		</tbody>
		</table>
<jsp:include page="adminfooter.jsp"/>