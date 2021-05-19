<jsp:include page="adminheader.jsp"/>
<script>
$(function(){
	$("#uname").blur(function(){
		var uname=$(this).val();
		$.post("checkstud",{"uname":uname},function(output){
			if(output.trim()=="yes"){
				$("#msg").html("Invalid User Id");
				$("#uname").val("");
			}
			else{
				$("#msg").html(output);
			}
		});
	});
	$("#bid").blur(function(){
		var bid=$(this).val();
		$.post("checkbook",{"bid":bid},function(output){
			if(output.trim()=="yes"){
				$("#msg2").html("Book is not available :( ");
				$("#bid").val("");
			}
			else{
				$("#msg2").html(output);
			}
		});
	});
});
</script>
<div class="container">
<h2>Issue Section</h2>
<div class="row">
	<div class="col-sm-8 mx-auto">
	<form method="post" action="issuebook">
		<div class="form-group">
			<label>Student User Name</label>
			<input type="text" name="uname" required class="form-control" id="uname">
			<h5 id="msg"></h5>
			<%if(session.getAttribute("path")!=null) {%>
			<img src="<%=session.getAttribute("path") %>" style="width:100px;height:100px;">
			<%} 
			session.removeAttribute("path");%>
		</div>
		<div class="form-group">
			<label>Book Id</label>
			<input type="text" name="bid" required class="form-control" id="bid">
			<h5 id="msg2"></h5>
		</div>
		<div class="form-group">
			<label>Date of Issue</label>
			<input type="date" name="Date" required class="form-control">
		</div>
		<input type="submit" value="Issue Book" class="btn btn-dark text-white float-right mt-3" id="btn">
		<div class="clearfix"></div>
		<h5 class="alert alert-danger mt-3" id="msg3"></h5>
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
<jsp:include page="adminfooter.jsp"/>s