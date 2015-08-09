<%@page import="java.util.ArrayList"%>
<%@page import="com.util.artist"%>
<%@page import="java.util.List"%>
<%@page import="com.util.artistUtil"%>
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

th, td {
	padding: 5px;
}
</style>
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
		<table border="1">
			<%
				int type = Integer.parseInt(request.getParameter("type"));
				String param = request.getParameter("param");
				System.out.println("From display ART" + type);
				System.out.println("From display ART" + param);

				artistUtil autil = new artistUtil();
				List<artist> artList = new ArrayList<artist>();
				switch (type) {
				case 1: // get arist details
				{
					artList = autil.getAllDetailsByArtName(param);
					break;
				}
				case 2: //get artist by country
				{
					artList = autil.getAllArtistByCountry(param);
					break;
				}
				case 3: //get artist by byear
				{
					artList = autil
							.getAllArtistByBirthYear(Integer.parseInt(param));
					break;
				}
				}
				if (artList.isEmpty()) {
					out.write("<script>");
					out.write("alert('Not a valid search!');");
					out.write("location.replace(document.referrer);");
					out.write("</script>");
				}

				for (artist art : artList) {
					String artName = art.name;
					int id = art.artist_id;
					int bYear = art.birth_year;
					String country = art.country;
					String desc = art.description;
			%>
			<tr>
				<th>Art</th>
				<th>Artist Name</th>
				<th>Birth Year</th>
				<th>Country</th>
				<th>Description</th>
			</tr>
			<tr>
				<td><a href="displayImages.jsp?type=4&param=<%=artName%>">
						<img
						src="http://www2.psd100.com/ppp/2013/11/0601/Artist-Icon-1106114610.png"
						height="50" width="50">
				</a></td>
				<td><%=artName%></td>
				<td><%=bYear%></td>
				<td><%=country%></td>
				<td><%=desc%></td>
			</tr>
			<%
				}
			%>
		</table>
	</center>

	<div id="footer">@Abhishek_Madav</div>
</body>
</html>