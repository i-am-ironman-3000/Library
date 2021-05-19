<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
</style>
</head>
<body>
<div class="jumbotron bg-dark text-white text-center">

<h3>Welcome to Library Management</h3>

</div>
<div class="container">
<div class="row">
<div class="col-sm-5 mx-auto">
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

</div>
</div>
<div class="container ">
<div class="row">
<div class="col-sm-6 mx-auto">

<h4> Admin Login</h4>
<form method="post" action="User">
   <div class="form-group">
   <input type="text" class="form-control" name="suname" placeholder="User Name">
   </div>
   <div class="form-group">
   <input type="password" class="form-control" name="spwd" placeholder="Password">
   </div>
   <input type="submit" value="Login" class="btn btn-dark text-white float-right">
</form>
<div class="clearfix"></div>

</div>

<div class="col-sm-6">
<h4>Student Login</h4>
<form method="post" action="Login">
   <div class="form-group">
   <input type="text" class="form-control" name="uname" placeholder="User Name">
   </div>
   <div class="form-group">
   <input type="password" class="form-control" name="pwd" placeholder="Password">
   </div>
   <input type="submit" value="Login" class="btn btn-dark text-white float-right">
</form>
   <a href="Registration.jsp" class="btn btn-sm btn-dark text-white float-left">create new account </a>
</div>

</div>
</div>


</body>
</html>