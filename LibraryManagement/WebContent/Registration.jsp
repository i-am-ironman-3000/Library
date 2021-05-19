<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div class="jumbotron bg-dark text-white text-center">
<script>
$(function(){
	$("#uname").blur(function(){
		var uname=$(this).val();
		$.post("checkreg",{"uname":uname},function(output){
			if(output.trim()=="yes"){
				$(".msg").html("User name cannot be taken :( ");
				$("#uname").val("");
			}
			else{
				$(".msg").html("");
			}
		});
	});
});
</script>
<h3>Welcome to Library Management</h3>
</div>
<div class="container">
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
<div class="row">
<div class="col-sm-6 mx-auto">
<h4>Student Registration</h4>
<form method="post" enctype="multipart/form-data" action="Register">
   <div class="form-group">
   <input type="text" class="form-control" name="sname" placeholder="Student Name" required>
   </div>
    <div class="form-group">
   <input type="text" class="form-control" name="uname" placeholder="User Name" required id="uname">
   <h5 class="msg"></h5>
   </div>
    <div class="form-group">
    <select name="gender" class="form-control" required>
    <option>----Select Gender---</option>
    <option>Male</option>
    <option>Female</option>
    </select>
   </div>
   <div class="form-group">
   <input type="file" class="form-control" name="pic"  required>
   </div>
   <div class="form-group">
   <input type="password" class="form-control" name="pwd" placeholder="Password" required>
   </div>
   <input type="submit" value="Register" class="btn btn-dark text-white float-right">
</form>
</div>
</div>
</div>
</body>
</html>