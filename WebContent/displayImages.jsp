<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.util.populateFields"%>
<%@page import="com.util.*"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.util.imageDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.util.imageUtil"%>
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

body {
	background-image: url("/Project-3_Abhishek_Madav/img/Gallery.jpg");
	background-size: cover;
}

.imageContainer {
	float: left;
	box-shadow: black;
	box-shadow: 2px 0px 21px #8887AF;
	border-radius: 20px;
	margin-left: 25%;
	margin-bottom: 50px;
	margin-right: 25%;
	
    background-color: white;
    opacity: 0.8;
	
}

.imageDisco {
	width: inherit;
	padding: 10px;
	margin: 15px;
}

.imageDisco: hover
{
width: 500px;
height:500px;
}
#iamatable {
	margin: 10px;
	word-wrap: break-word;
	padding: 5px;
	text-align: center;
	margin: 10px;
	border-color: palegoldenrod;
	word-wrap: break-word;
	border-radius: 15px;
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

#iamgeUploader{
	position: absolute;
	top: 20%;
	padding: 25px;
	left: 40%;
	margin-top: -100px;
	margin-left: -150px;
	background-color: #EDEBE4;
	border-radius: 5px;
	text-align: center;
	z-index: 11; /* 1px higher than the overlay layer */
}

#modifyImageDetails {
	position: absolute;
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

.overlay {
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 10;
}

th, td {
	padding: 5px;
}

#footer {
	width: 100%;
	height: 40px;
	position: fixed;
	bottom: 0;
	left: 0;
	background: black;
	text-align: center;
	color: white;
	padding: 25px;
}
</style>
<script type="text/javascript">
	function toggledivnew(id) {
		var div = document.getElementById(id);
		div.style.display = div.style.display == "none" ? "block" : "none";
		var val = getRadioValMod();
		var elem = document.getElementById("showMeWE");
		elem.value = val;
		document.getElementById("overlay").style.display = "block";
	}

	function togglediv(id) {
		var div = document.getElementById(id);
		div.style.display = div.style.display == "none" ? "block" : "none";
		document.getElementById("overlay").style.display = "block";
	}
	
	function overlayClose() {
		document.getElementById("overlay").style.display = "none";
	}
	
	function imgdeletehandler() {
		var x;
		if (confirm("Are you sure you want to delete the Image?") == true) {
			x = getRadioValDel();
			document.location.href = "deleteImage?image_id=" + x;
		} else {
			x = "You pressed Cancel!";
		}
	}

	function getRadioValMod() {
		var val;
		var radios = document.getElementsByName("modifyButtonW"); 
		for (var i = 0, len = radios.length; i < len; i++) {
			if (radios[i].checked) {
				val = radios[i].value;
				console.log("radioButton " + i + ": " + radios[i].value)
				break; // and break out of for loop
			}
		}
		return val;
	}
	

	function getRadioValDel() {
		var val;
		var radios = document.getElementsByName("deleteButton"); 
		for (var i = 0, len = radios.length; i < len; i++) {
			if (radios[i].checked) {
				val = radios[i].value;
				console.log("radioButton " + i + ": " + radios[i].value)
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

<!-- 		<div> -->
<!-- 			<a href="upload.jsp"><input type="button" class="btn" -->
<!-- 				value="Add new Image"></a> -->
<!-- 		</div> -->
		<div>
		<input type="button" class="btn" value="Add new Image" onclick="togglediv('iamgeUploader')">
		</div>
		
		<br>

		<div>
			<%
				int type = Integer.parseInt(request.getParameter("type"));
				String param = request.getParameter("param");
				System.out.println("From display" + type);
				System.out.println("From display" + param);

				imageUtil imgutil = new imageUtil();
				List<imageDetails> imgList = new ArrayList<imageDetails>();
				switch (type) {
				case 1: // get imagedetails by gallery_id
				{
					imgList = imgutil.getAllImagesByGalID(Integer.parseInt(param));
					break;
				}
				case 2: //get imagedetails by type
				{
					imgList = imgutil.getAllImagesByType(param);
					break;
				}
				case 3: //get imagedetail by year
				{
					int[] year = new int[2];
					int i = 0;
					for (String s : param.split(",")) {
						year[i++] = Integer.parseInt(s);
					}
					int yearFrom = year[0];
					int yearTo = year[1];
					imgList = imgutil.getAllImagesByYearRange(yearFrom, yearTo);
					break;

				}
				case 4: //artist name
				{
					imgList = imgutil.getAllImagesByArtistName(param);
					break;
				}
				case 5: //location
				{
					imgList = imgutil.getAllImagesByLocation(param);
					break;
				}

				}
// 				if (imgList.isEmpty()) {
// 					out.write("<script>");
// 					out.write("alert('Not a valid search!');");
// 					out.write("location.replace(document.referrer);");
// 					out.write("</script>");
// 				}

				if (imgList.isEmpty()) {
					out.write("<center>");
					out.write("No results to show!");
					out.write("</center>");
// 					out.write("location.replace(document.referrer);");
// 					out.write("</script>");
				}
				else
				{
					out.write("<center>");
					out.print("Displaying " + imgList.size() + " image(s)");
					out.write("</center><br>");
				}
				Map<Integer, artist> artmap = new populateFields().getArtistMap();
				Iterator<imageDetails> itr = imgList.iterator();
				while (itr.hasNext()) {
					imageDetails imgd = (imageDetails) itr.next();
					System.out.println(imgd.titlein);
					System.out.println(imgd.artist_idin);
					JspWriter outwr = null;
			%>

			<div id="<%=imgd.image_id%>" class="imageContainer">
				<form id="imgConForm" class="imgConForm">
					<img src="imageServ?imgid=<%=imgd.image_id%>" width="200"
						height="200" id=<%=imgd.image_id%> class="imageDisco" />
						<%
						System.out.println();
						if(!(imgd.linkin == null)) {%>
						<a href="<%=imgd.linkin%>"><% out.write("<p>"); out.write(imgd.linkin); out.write("</p>");%></a><%} %>
					<table border="2" id="iamatable">
						<tr>
							<th>Title</th>
							<th>Artist Name</th>
							<th>Type</th>
							<th>Year</th>
							<th>Width</th>
							<th>Height</th>
							<th>Location</th>
							<th>Description</th>
							<th>Modify</th>
							<th>Delete</th>
						</tr>
						<tr>
							<td>
								<%
									out.write("<p>");
										out.write(imgd.titlein);
										out.write("</p>");
								%>
							</td>
							<td><a
								href="displayArtist.jsp?type=1&param=<%=artmap.get(imgd.artist_idin).name.trim()%>">
									<%
										out.write("<p>");
											out.print(artmap.get(imgd.artist_idin).name);
											out.write("</p>");
									%>
							</a></td>
							<td>
								<%
									out.write("<p>");
										out.print(imgd.typein);
										out.write("</p");
								%>
							</td>
							<td>
								<%
									out.write("<p>");
										out.print(imgd.yearin);
										out.write("</p");
								%>
							</td>
							<td>
								<%
									out.write("<p>");
										out.print(imgd.widthin);
										out.write("</p");
								%>
							</td>
							<td>
								<%
									out.write("<p>");
										out.print(imgd.heightin);
										out.write("</p");
								%>
							</td>
							<td>
								<%
									out.write("<p>");
										out.print(imgd.locationin);
										out.write("</p");
								%>
							</td>
							<td>
								<%
									out.write("<p>");
										out.write(imgd.descriptionin);
										out.write("</p");
								%>
							</td>
							<td><input type="radio" id="radiobutwe"
								value="<%=imgd.image_id%>" name="modifyButtonW"
								onclick="toggledivnew('modifyImageDetails'); getRadioVal('imgConForm','modifyButtonW');"></td>
							<td><input type="radio" id="radiobutwe"
								value="<%=imgd.image_id%>" name="deleteButton"
								onclick="imgdeletehandler();"></td>
						</tr>
					</table>
				</form>
			</div>
			<%
				}
			%>

		</div>

		<br>


		<div id="modifyImageDetails" style="display: none;">
			<form action="modifyImage">
				<center>
					<input type="hidden" name="image_id" id="showMeWE"><br>
					<table border="2">
						<tr>
							<td>Input Image Title:</td>
							<td><input type="text" name="title"></td>
						</tr>
						<tr>
							<td>Input Image Year:</td>
							<td><input type="text" name="year" maxlength="4"></td>
						</tr>
						<tr>
							<td>Input Image Type:</td>
							<td><input type="text" name="img_type"></td>
						</tr>
						<tr>
							<td>Input Image Location:</td>
							<td><input type="text" name="img_location"></td>
						<tr>
						<tr>
							<td>Input Image Description:</td>
							<td><textarea name="image_desc" rows="4" cols="50"></textarea></td>
						</tr>
						<tr>
							<td style="text-align: center;"><input type="button"
								class="btn" value="Cancel"
								onclick="togglediv('modifyImageDetails'); overlayClose();"></td>
							<td colspan="2"><input class="btn" type="submit" value="Submit"></td>
						</tr>
					</table>
				</center>
			</form>
		</div>
	</center>

	<div id="iamgeUploader" style="display: none;">
		<h1>File Upload!</h1>
		<form method="post" action="uploadServlet"
			enctype="multipart/form-data">
			<table border="0">
				<tr>
					<td>Title</td>
					<td><input type="text" name="titlein" size="50" /></td>
				</tr>
				<tr>
					<td>Gallery</td>
					<td><select id="galleryDropDown" name="gallery_idin">
							<option value="0">Select Gallery</option>
							<%
								Iterator<gallery> itrwe = new populateFields().getGalleryList()
										.iterator();
								while (itrwe.hasNext()) {
									gallery gal = itrwe.next();
									out.write("<option value=" + gal.gallery_id + ">" + gal.name); //'+ "\">");
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Artist</td>
					<td><select id="artistDropDown" name="artist_idin">
							<option value="0">Select Artist</option>
							<%
													for(Map.Entry<Integer, artist> ent: new populateFields().getArtistMap().entrySet()) {
														artist art = ent.getValue();
														out.write("<option value=" + ent.getKey() + ">" + art.name); //'+ "\">");
													}
							%>
					</select></td>
				</tr>
				<tr>
					<td>Year</td>
					<td><input type="text" name="yearin" size="4" maxlength="4" /></td>
				</tr>
				<tr>
					<td>Type</td>
					<td><input type="text" name="typein" size="50" /></td>
				</tr>
				<tr>
					<td>Width</td>
					<td><input type="text" name="widthin" size="50" /></td>
				</tr>
				<tr>
					<td>Height</td>
					<td><input type="text" name="heightin" size="50" /></td>
				</tr>
				<tr>
					<td>Location</td>
					<td><input type="text" name="locationin" size="50" /></td>
				</tr>
				<tr>
					<td>Link</td>
					<td><input type="text" name="linkin" size="50" /></td>
				</tr>
				<tr>
					<td>Description</td>
					<!-- <td><input type="text" name="descriptionin" /></td> -->
					<td><textarea name='descriptionin' id='comment'
							style="margin: 0px; width: 386px; height: 184px;"></textarea></td>
				</tr>
				<tr>
					<td>Upload Image</td>
					<td><input type="file" name="photo" size="50" /></td>
				</tr>
				<tr>
				<td style="text-align: center;"><input type="button"
								class="btn" value="Cancel"
								onclick="togglediv('iamgeUploader'); overlayClose();"></td>
					<td colspan="3"><input type="submit" class="btn" value="Save"></td>
				</tr>
			</table>
		</form>

	</div>
	
	<div id="footer">@Abhishek_Madav</div>
</body>
</html>