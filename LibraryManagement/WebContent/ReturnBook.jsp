<jsp:include page="adminheader.jsp"/>
<<script type="text/javascript">
$(function(){
	$("#uname").blur(function(){
		var uname=$(this).val();
		$.post("checkfine",{"uname":uname},function(output){
			$(".msg").html(output);
		});
	});
});
</script>
<div class="container">
	<div class="row">
		<div class="col-sm-8 mx-auto">
			<form method="post" action="ReturnBook">
				<div class="form-group">
					<label>Student User Name</label>
					<input type="text" name="uname" required class="form-control" id="uname">
					<div class="msg">
				</div>
				<div class="form-group">
					<label>Book Id</label>
					<input type="text" name="bid" required class="form-control" id="bid">
				</div>
				<div class="form-group">
					<label>Date of return</label>
					<input type="date" name="date" required class="form-control" id="date">
				</div>
				<input type="submit" value="Return Book" class="btn btn-dark text-white float-right mt-3" id="btn">
			</form>
		</div>
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
</div>
<jsp:include page="adminfooter.jsp"/>