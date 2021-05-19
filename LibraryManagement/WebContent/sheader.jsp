<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.min.js"></script>
<style>
.ab{
display:block;
text:white;
text-decoration:none;
padding:10px;
border-bottom:1px solid white;
color:white;
transition: 0.5s;
transition-property: background-color;
}
.ab:hover{
background-color:white;
text-decoration:none;
 color:black;

}
.image{
	width:100%;
	height:200px;
}
</style>
</head>
<body>
<div class="container-fluid">
<div class="row">
<div class="col-sm-2 p-0" style="min-height:100vh;background-color:black">
<img src="<%=session.getAttribute("pic") %>" class="image">
<a href="SDashboard.jsp" class="ab">Home</a>
<a href="Notofication.jsp" class="ab">Notification</a>
<a href="cart.jsp" class="ab">Cart</a>
<a href="ChngPwd.jsp" class="ab">Change Password</a>
<a href="Logout" class="ab">Logout</a>
</div>
<div class="col-sm-10 p-0">
<div class="jumbotron text-center text-white bg-dark">
<h2>Welcome !<%=session.getAttribute("sname") %></h2>


</div>