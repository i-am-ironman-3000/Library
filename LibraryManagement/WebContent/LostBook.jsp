<jsp:include page="adminheader.jsp"></jsp:include>
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
		$.post("price",{"bid":bid},function(){
			$("#msg").html(output);
		});
	});
});
</script>
<div class="row">
	<div class="col-sm-6 mx-auto">
	<form method="post" action="OkServlet">
		<div class="form-group">
			<input type="text" name="uname" required id="uname" placeholder="User Name" class="form-control">
			<h5 id="msg"></h5>
		</div>
		<div class="form-group">
			<input type="text" name="bid" required id="bid" placeholder="Book Id" class="form-control">
			<h5 id="msg"></h5>
		</div>
		<div class="form-group">
		    <label>Today's Date</label>
			<input type="date" name="date" required id="uname" class="form-control">
		</div>
		<input type="submit" value="Ok" class="btn btn-dark btn-block mt-3 text-white">
	</form>
	</div>
</div>
<jsp:include page="adminfooter.jsp"></jsp:include>