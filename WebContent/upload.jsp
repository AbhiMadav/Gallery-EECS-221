<%@page import="java.util.Map"%>
<%@page import="com.util.gallery"%>
<%@page import="com.sun.corba.se.impl.util.Version"%>
<%@page import="com.util.artist"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload to Database Demo</title>
<BODY>
	<%@page import="com.util.populateFields"%>
	<center>
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
								Iterator<gallery> itr = new populateFields().getGalleryList()
										.iterator();
								while (itr.hasNext()) {
									gallery gal = itr.next();
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
					<td>Description</td>
					<!-- <td><input type="text" name="descriptionin" /></td> -->
					<td><textarea name='descriptionin' id='comment' style="margin: 0px; width: 321px; height: 184px;"></textarea></td>
				</tr>
				<tr>
					<td>Upload Image</td>
					<td><input type="file" name="photo" size="50" /></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" value="Save"></td>
				</tr>
			</table>
		</form>
	</center>
</BODY>
</HTML>