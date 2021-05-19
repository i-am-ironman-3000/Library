
<jsp:include page="sheader.jsp"/>
<script>
	$(function(){
		$("#name").keyup(function(){
			var s=$(this).val();
			$.get("books.jsp",{"name":s},function(output){
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
<jsp:include page="sfooter.jsp"/>