<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.min.js"></script>
<style>
.click {
	display:block;
	color :white;
	padding:10px;
	text-align:center;
	border:2px solid black; 
	margin:10px 10px;
	transition: 0.5s;
	transition-property: background-color;
}
a:hover{
	background-color: black;
	color: white;
}

</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2 bg-dark m-0 p-0">
			<img src="images/h.jpg" style="width:100%;">
			<a href="AdminDash.jsp" class="click">Home</a>
			<a href="cat.jsp" class="click">Add Catogery</a>
			<a href="AddBook.jsp" class="click">Add Books</a>
			<a href="issuebook.jsp" class="click">Issue Books</a>
			<a href="ViewBook.jsp" class="click">View Books</a>
			<a href="ReturnBook.jsp" class="click">Return Books</a>
			<a href="LostBook.jsp" class="click">Lost Book</a>
			<a href="Student.jsp" class="click">Students</a>
			<a href="notify" class="click">Notify Everyone</a>
			<a href="collect.jsp" class="click">Collected fine</a>
			<a href="changepass.jsp" class="click">Change Password</a>
			<a href="Logout" class="click">Logout</a>
		</div>
		<div class="col-sm-10 m-0 p-0" style="min-height:100vh">
			<div class="jumbotron bg-dark text-center text-white"><h2>Welcome !<%=session.getAttribute("name") %></h2></div>