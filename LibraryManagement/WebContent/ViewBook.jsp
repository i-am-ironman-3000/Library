
<jsp:include page="adminheader.jsp"/>
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
<script>
	$(function(){
		$("#name").keyup(function(){
			var s=$(this).val();
			$.get("viewall.jsp",{"name":s},function(output){
				$(".result").html(output);
			});
		});
	});
	
</script>
<div class="container">
	<div class="row">
	<div class="col-sm-3 mx-auto">
	<div class="form-group mt-3">
		<input type="search" id="name"
		class="form-control" 
		placeholder="Enter name to search">
	</div>
	</div>
	<div class="col-sm-3 mx-auto">
	
</div>
</div>
<div class="result"></div>
	</div>
<jsp:include page="adminfooter.jsp"/>