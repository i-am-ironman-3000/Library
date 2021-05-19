<jsp:include page="sheader.jsp"/>
<div class="container">
<div class="row">
<div class="col-sm-6 mx-auto">
<%
if (session.getAttribute("msg") != null) {
%>
<div class="alert alert-danger text-center font-weight-bold">
<%=session.getAttribute("msg")%>
</div>
	<%
session.removeAttribute("msg");
	}
	%>
	<form method="post" action="ChangePass">
	<div class="form-group">
	<label>Current Password</label>
	 <input type="password" class="form-control" name="pwd" placeholder="Current Password">
	</div>
	<div class="form-group">
	<label>New Password</label> 
	<input type="password" class="form-control" name="npwd" placeholder="New Password">
	</div>
		<div class="form-group">
	<label>Confirm New Password</label> 
	<input type="password" class="form-control" name="cpwd"	placeholder="Confirm New Password">
	</div>
	<input type="submit" value="change password" class="btn btn-primary float-right">
	</form>

</div>


</div>
</div>
<jsp:include page="sfooter.jsp"/>