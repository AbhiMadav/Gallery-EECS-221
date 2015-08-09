<%@page import="org.w3c.dom.Document"%>
<%@page import="com.util.populateFields"%>
<%@page import="com.util.gallery"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>List All Galleries</title>
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

#addNewGalleryForm, #modifyGalleryDetails {
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

td {
	padding: 5px;
}
</style>

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

	function deletehandler() {
		var x;
		if (confirm("Are you sure you want to delete the gallery?") == true) {
			x = getRadioVal(document.getElementById('galConForm'),
					'deleteButton');
			document.location.href = "deleteGallery?gal_id=" + x;
		} else {
			x = "You pressed Cancel!";
		}
	}
	function getRadioVal(form, name) {
		var val;
		// get list of radio buttons with specified name
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
		<button class="btn" onclick="togglediv('addNewGalleryForm')">Add
			New Gallery</button>
	</center>
	<br><br>
	<div id="container">
		<div id="gallerycontainer">
			<center>
				<form id="galConForm" class="galConForm">
					<table border="1">
						<%
							List<gallery> listgal = new populateFields().getGalleryList();
							Iterator<gallery> itr = listgal.iterator();
							gallery gal = null;
							while (itr.hasNext()) {
						%>
						<tr>
						<tr>
							<%
								gal = itr.next();
									int gallery_id = gal.gallery_id;
									String gal_name = gal.name;
									String gal_desc = gal.description;
							%>
							<td><a href="displayImages.jsp?type=1&param=<%=gallery_id%>">
									<img
									src="http://www.stainedglassworkshop.org/wp-content/plugins/complete-gallery-manager/images/gallery_icon@2x.png"
									height="50" width="50">
							</a></td>
							<td><%=gal_name%></td>
							<td><%=gal_desc%></td>
							<%-- <td><input type="button" id="<%=gallery_id%>" name ="modifyButton" value="Modify Details" onclick="togglediv('modifyGalleryDetails')"></td> --%>
							<td>Modify <input type="radio" id="radiobut"
								value="<%=gallery_id%>" name="modifyButton"
								onclick="toggledivnew('modifyGalleryDetails'); getRadioVal('galConForm','modifyButton');"></td>

							<td>Delete <input type="radio" id="radiobut"
								value="<%=gallery_id%>" name="deleteButton"
								onclick="deletehandler();"></td>
						</tr>
						<%
							}
						%>
						<tr>
					</table>
				</form>
			</center>
		</div>
		<br> <br>


		<div id="addNewGalleryForm" style="display: none;">
			<form action="addNewGallery">
				<center>
					<table border="2">
						<tr>
							<td>Input Gallery Name:</td>
							<td><input type="text" name="gallery_name" size="50"></td>
						</tr>
						<tr>
							<td>Input Gallery Description:</td>
							<td><textarea name="gallery_desc" rows="4" cols="50"
									style="width: 383px;"></textarea></td>
						</tr>
						<tr>
							<td style="text-align: center;"><input type="button"
								class="btn" value="Cancel"
								onclick="togglediv('addNewGalleryForm'); overlayClose();"></td>
							<td colspan="2" style="text-align: center;"><input
								type="submit" class="btn" value="Submit"></td>
						</tr>
					</table>
				</center>
			</form>
		</div>


		<div id="modifyGalleryDetails" style="display: none;">
			<form action="modifyGallery">
				<center>
					<input type="hidden" name="mgallery_id" id="showMe"><br>
					<table border="2">
						<tr>
							<td>Input New Gallery Name:</td>
							<td><input type="text" name="mgallery_name" size="50"></td>
						</tr>
						<tr>
							<td>Input New Gallery Description:</td>
							<td><textarea name="mgallery_desc" rows="4" cols="50"
									style="width: 383px;"></textarea></td>
						</tr>
						<tr>
							<td style="text-align: center;"><input type="button"
								class="btn" value="Cancel"
								onclick="togglediv('modifyGalleryDetails'); overlayClose();"></td>
							<td colspan="2"><input type="submit" class="btn"
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