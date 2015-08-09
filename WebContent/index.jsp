<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style>

body{
background-image: url("/Project-3_Abhishek_Madav/img/GalleryBackground.jpg");

}


#footer {
	width: 100%;
	height: 80px;
	position: absolute;
	bottom: 0;
	left: 0;
	background: black;
	text-align: center;
	color: white;
	padding: 25px;
}

.btn {
	background: #3498db;
	background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
	background-image: -moz-linear-gradient(top, #3498db, #2980b9);
	background-image: -ms-linear-gradient(top, #3498db, #2980b9);
	background-image: -o-linear-gradient(top, #3498db, #2980b9);
	background-image: linear-gradient(to bottom, #3498db, #2980b9);
	-webkit-border-radius: 28;
	-moz-border-radius: 28;
	border-radius: 28px;
	-webkit-box-shadow: 0px 1px 3px #666666; -moz-box-shadow : 0px 1px 3px
	#666666; box-shadow : 0px 1px 3px #666666;
	font-family: Arial;
	color: #ffffff;
	padding: 10px 20px 10px 20px;
	text-decoration: none;
	-moz-box-shadow: 0px 1px 3px #666666;
	box-shadow: 0px 1px 3px #666666;
}

.btn:hover {
	background: #3cb0fd;
	background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
	background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
	text-decoration: none;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">A-Galleria</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="listAllGalleries.jsp">Galleries</a></li>
					<li><a href="listAllArtists.jsp">Artists</a></li>
					<li><a href="search.jsp">Search</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<h1 style="text-align: center;">EECS 211- Data Engineering.</h1>

		</div>
	</div>
	<div>
		<a href="listAllGalleries.jsp"><input id="button" type="button"
			class="btn" style="text-align: center; margin-left: 46%;"
			value="Let's get started!"></a>
	</div>
	<div id="footer">@Abhishek_Madav</div>


</body>
</html>
