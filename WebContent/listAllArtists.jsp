<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.util.populateFields"%>
<%@page import="com.util.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
body {
	background-image: url("/Project-3_Abhishek_Madav/img/Gallery.jpg");
	background-size: cover;
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
	-webkit-box-shadow: 0px 1px 3px #666666;
	-moz-box-shadow: 0px 1px 3px #666666;
	box-shadow: 0px 1px 3px #666666;
	font-family: Arial;
	color: #ffffff;
	padding: 10px 20px 10px 20px;
	text-decoration: none;
	-moz-box-shadow: 0px 1px 3px #666666;
	box-shadow: 0px 1px 3px #666666;
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

.imageContainer {
	float: left;
	box-shadow: black;
	box-shadow: 2px 0px 21px #8887AF;
	border-radius: 20px;
}

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

.overlay {
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 10;
}

#addNewArtist, #modifyArtDetails {
	position: fixed;
	top: 40%;
	padding: 25px;
	left: 40%;
	margin-top: -100px;
	margin-left: -150px;
	background-color: #EDEBE4;
	border-radius: 5px;
	text-align: center;
	z-index: 11; /* 1px higher than the overlay layer */
}

th, td {
	padding: 5px;
}
</style>
<script type="text/javascript">
	function togglediv(id) {
		var div = document.getElementById(id);
		div.style.display = div.style.display == "none" ? "block" : "none";
		document.getElementById("overlay").style.display = "block";
	}

	function overlayClose() {

		document.getElementById("overlay").style.display = "none";

	}
</script>
<script type="text/javascript">
	function toggledivnew(id) {
		var div = document.getElementById(id);
		div.style.display = div.style.display == "none" ? "block" : "none";
		var val = getRadioVal(document.getElementById('galConForm'),
				'modifyButton');

		var elem = document.getElementById("showMe");
		elem.value = val;
		document.getElementById("overlay").style.display = "block";
	}

	function artdeletehandler() {
		var x;
		if (confirm("Are you sure you want to delete the artist?") == true) {
			x = getRadioVal(document.getElementById('galConForm'),
					'deleteButton');
			document.location.href = "deleteArtist?art_id=" + x;
		} else {
			x = "You pressed Cancel!";
		}
	}

	function getRadioVal(form, name) {
		var val;
		var radios = form.elements[name];
		// loop through list of radio buttons
		for (var i = 0, len = radios.length; i < len; i++) {
			if (radios[i].checked) { // radio checked?
				val = radios[i].value; // if so, hold its value in val
				break; // and break out of for loop
			}
		}
		return val;
	}
</script>
<title>Display Images</title>
</head>
<body>

	<div class="overlay" id="overlay" style="display: none;"></div>

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
		<button class="btn" onclick="togglediv('addNewArtist')">Add
			New Artist</button>
	</center>
	<br>
	<br>
	<div id="container">
		<div id="gallerycontsainer">
			<center>
				<form id="galConForm" class="galConForm">
					<table border="1">
						<%
							Map<Integer, artist> artmap = new populateFields().getArtistMap();
							for (Map.Entry<Integer, artist> ent : artmap.entrySet()) {
								artist gal = ent.getValue();
						%>
						<tr>
							<%
								int art_id = gal.artist_id;
									String art_name = gal.name;
									int birthyear = gal.birth_year;
									String country = gal.country;
									String desc = gal.description;
							%>
							<td><a href="displayImages.jsp?type=4&param=<%=art_name%>">
									<img
									src="http://www2.psd100.com/ppp/2013/11/0601/Artist-Icon-1106114610.png"
									height="50" width="50">
							</a></td>
							<td><%=art_name%></td>
							<td><%=desc%></td>
							<td>Modify <input type="radio" id="radiobut"
								value="<%=art_id%>" name="modifyButton"
								onclick="toggledivnew('modifyArtDetails'); getRadioVal('galConForm','modifyButton');"></td>

							<td>Delete <input type="radio" id="radiobut"
								value="<%=art_id%>" name="deleteButton"
								onclick="artdeletehandler();"></td>
						</tr>
						<%
							}
						%>
					</table>
				</form>
			</center>
		</div>
		<br> <br>
		<div id="addNewArtist" style="display: none;">
			<form action="addNewArtist">
				<center>
					<table border="2">
						<tr>
							<td>Input Artist Name:</td>
							<td><input type="text" name="art_name" size="50"></td>
						</tr>
						<tr>
							<td>Input Artist BirthYear:</td>
							<td><input type="text" name="birthYear" maxlength="4"></td>
						</tr>
						<tr>
							<td>Input Artist Country:</td>
							<td><input type="text" name="country" size="50"></td>
						</tr>
						<tr>
							<td>Input Artist Description:</td>
							<td><textarea name="art_desc" rows="4" cols="50"></textarea></td>
						</tr>
						<tr>
							<td style="text-align: center;"><input type="button"
								class="btn" value="Cancel"
								onclick="togglediv('addNewArtist'); overlayClose();"></td>
							<td colspan="2"><input type="submit" class="btn"
								value="Submit"></td>
						</tr>
					</table>
				</center>
			</form>
		</div>


		<div id="modifyArtDetails" style="display: none;">
			<form action="modifyArtist">
				<center>
					<input type="hidden" name="mart_id" id="showMe"><br>
					<table border="2">
						<!-- 						<tr> -->
						<!-- 							<td>Input Artist Name:</td> -->
						<!-- 							<td><input type="text" name="art_name" size="50"></td> -->
						<!-- 						</tr> -->
						<tr>
							<td>Input Artist BirthYear:</td>
							<td><input type="text" name="birthYear" maxlength="4"></td>
						</tr>
						<tr>
							<td>Input Artist Country:</td>
							<td><input type="text" name="country" size="50"></td>
						</tr>
						<tr>
							<td>Input Artist Description:</td>
							<td><textarea name="art_desc" rows="4" cols="50"></textarea></td>
						</tr>
						<tr>
							<td style="text-align: center;"><input type="button"
								class="btn" value="Cancel"
								onclick="togglediv('modifyArtDetails'); overlayClose();"></td>
							<td colspan="2"><input class="btn" type="submit"
								value="Submit"></td>
						</tr>
					</table>
				</center>
			</form>
		</div>
	</div>

	<div id="footer">@Abhishek_Madav</div>
</body>
</html>