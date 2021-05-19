<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="library.dbutil"%>
<%@page import="java.sql.*"%>
<jsp:include page="adminheader.jsp"/>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>fine</th>
			<th>date</th>
		</tr>
	</thead>
	<tbody>
	<%
	Connection con=dbutil.connect();
	String sql="select sum(fine),d from fine group by d";
	Statement s=con.createStatement();
	ResultSet rs=s.executeQuery(sql);
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("sum(fine)") %></td>
		<td><%=rs.getString("d") %></td>
	</tr>
<%
	}
	con.close();
%>
</tbody>
</table>
<jsp:include page="adminfooter.jsp"/>