	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<style>
	#footer {
	width: 100%;
	height: 40px;
	position: absolute;
	bottom: 0;
	left: 0;
	background: black;
	text-align: center;
	color: white;
	padding: 25px;
}
	
body {
	background-image: url("/Project-3_Abhishek_Madav/img/Gallery.jpg");
	background-size: cover;
}
	form
	{
	text-align: center;
	}
	</style>
<script type="text/javascript">
	function check() {
		var dropdown = document.getElementById("searchCriteria");
		var current_value = dropdown.options[dropdown.selectedIndex].value;
		if (current_value == "image") {
			document.getElementById("imageOptions").style.display = "block";
			document.getElementById("artistOptions").style.display = "none";
		} else if (current_value == "artist") {
			document.getElementById("artistOptions").style.display = "block";
			document.getElementById("imageOptions").style.display = "none";
		}
	}

	function displayImageOption() {
		var dropdownval = document.getElementById("imageSearchDropDown");
		var current_val = dropdownval.options[dropdownval.selectedIndex].value;
		if (current_val == "type") {
			document.getElementById("searchByType").style.display = "block";
			document.getElementById("searchByYearRange").style.display = "none";
			document.getElementById("searchByArtName").style.display = "none";
			document.getElementById("searchByLocation").style.display = "none";
		} else if (current_val == "yearR") {
			document.getElementById("searchByYearRange").style.display = "block";
			document.getElementById("searchByArtName").style.display = "none";
			document.getElementById("searchByLocation").style.display = "none";
			document.getElementById("searchByType").style.display = "none";
		} else if (current_val == "artName") {
			document.getElementById("searchByArtName").style.display = "block";
			document.getElementById("searchByLocation").style.display = "none";
			document.getElementById("searchByType").style.display = "none";
			document.getElementById("searchByYearRange").style.display = "none";
		} else if (current_val == "location") {
			document.getElementById("searchByLocation").style.display = "block";
			document.getElementById("searchByType").style.display = "none";
			document.getElementById("searchByYearRange").style.display = "none";
			document.getElementById("searchByArtName").style.display = "none";
		}

	}

	function displayArtistOption() {
		var dropdownv = document.getElementById("artistSearchDropDown");
		var current_ = dropdownv.options[dropdownv.selectedIndex].value;
		if (current_ == "country") {
			document.getElementById("searchByArtCountry").style.display = "block";
			document.getElementById("searchByArtBirthyear").style.display = "none";
		} else if (current_ == "birthYear") {
			document.getElementById("searchByArtCountry").style.display = "none";
			document.getElementById("searchByArtBirthyear").style.display = "block";
		}
	}
</script>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">A-Galeria</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">Home</a></li>
				<li><a href="listAllGalleries.jsp">Galleries</a></li>
				<li><a href="listAllArtists.jsp">Artists</a></li>
				<li><a href="search.jsp">Search</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<center>
		<div>
			<div>
				<select id="searchCriteria" onchange="check();">
					<option value="0">Select a search option!</option>
					<option value="image">Search Images</option>
					<option value="artist">Search Artists</option>
				</select>
			</div>
			<br>
			<div id="imageOptions" style="display: none;">
				<select id="imageSearchDropDown" onchange="displayImageOption();">
					<option value="0">Select a search option!</option>
					<option value="type">Type</option>
					<option value="yearR">Year Range</option>
					<option value="artName">Artist Name</option>
					<option value="location">Location</option>
				</select>
			</div>
			<br>
			<div id="artistOptions" style="display: none;">
				<select id="artistSearchDropDown" onchange="displayArtistOption();">
					<option value="0">Select a search option!</option>
					<option value="country">Country</option>
					<option value="birthYear">Birth Year</option>
				</select>
			</div>
		</div>

		<div>
			<div id="searchByType" style="display: none;">
				<form action="search" method="get">
					<input type="hidden" name="type" value="1"> Enter the type:
					<input type="text" name="ttype"><br><br><input class="btn btn-info btn-lg"
						type="submit" value="Search!">
				</form>
			</div>

			<div id="searchByYearRange" style="display: none;">
				<form action="search" method="get">
					<input type="hidden" name="type" value="2"> Enter the FROM
					year: <input type="text" name="yearFrom"><br><br> Enter
					the TO year: <input type="text" name="yearTo"><br><br> <input class="btn btn-info btn-lg"
						type="submit" value="Search!">
				</form>
			</div>

			<div id="searchByArtName" style="display: none;">
				<form action="search" method="get">
					<input type="hidden" name="type" value="3"> Enter the
					Artist Name: <input type="text" name="artName"><br><br> <input class="btn btn-info btn-lg"
						type="submit" value="Search!">
				</form>
			</div>

			<div id="searchByLocation" style="display: none;">
				<form action="search" method="get">
					<input type="hidden" name="type" value="4"> Enter the
					location: <input type="text" name="location"><br><br> <input class="btn btn-info btn-lg"
						type="submit" value="Search!">
				</form>
			</div>

			<div id="searchByArtCountry" style="display: none;">
				<form action="search" method="get">
					<input type="hidden" name="type" value="5"><br> Enter the
					Artist Country: <input type="text" name="artCountry"><br>
					<br> <input class="btn btn-info btn-lg" type="submit" value="Search!">
				</form>
			</div>

			<div id="searchByArtBirthyear" style="display: none;">
				<form action="search" method="get">
					<input type="hidden" name="type" value="6"><br> Enter the
					Artist Birth Year: <input type="text" name="artBirthYear"
						maxlength="4"><br><br> <input class="btn btn-info btn-lg" type="submit"
						value="Search!">
				</form>
			</div>
		</div>
	</center>
	
	<div id="footer">@Abhishek_Madav</div>
</body>
</html>