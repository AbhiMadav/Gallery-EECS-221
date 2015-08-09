package com.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class imageUtil {

	public imageUtil() {
		// TODO Auto-generated constructor stub
	}
	
	public List<imageDetails> getAllImagesByGalID(int gallery_id) throws SQLException, IOException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select image_id, title, link, gallery_id, artist_id, year, type, width, height, location, description from image natural join detail where gallery_id = ?");
		psmt.setInt(1, gallery_id); 
		ResultSet rs = psmt.executeQuery();
		List<imageDetails> imgList = new ArrayList<imageDetails>();
		while (rs.next()) {
			imageDetails img = new imageDetails();
			img.image_id = rs.getInt(1);
			img.titlein = rs.getString(2);
			img.linkin = rs.getString(3);
			img.gallery_idin = rs.getInt(4);
			img.artist_idin = rs.getInt(5);
			img.yearin = rs.getInt(6);
			img.typein = rs.getString(7);
			img.widthin = rs.getInt(8);
			img.heightin = rs.getInt(9);
			img.locationin = rs.getString(10);
			img.descriptionin = rs.getString(11);
			imgList.add(img);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return imgList;
	}

	public List<imageDetails> getAllImagesByType(String type) throws SQLException, IOException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select image_id, title, link, gallery_id, artist_id, year, type, width, height, location, description from image natural join detail where type = ?");
		psmt.setString(1, type); 
		ResultSet rs = psmt.executeQuery();
		List<imageDetails> imgList = new ArrayList<imageDetails>();
		while (rs.next()) {
			imageDetails img = new imageDetails();
			img.image_id = rs.getInt(1);
			img.titlein = rs.getString(2);
			img.linkin = rs.getString(3);
			img.gallery_idin = rs.getInt(4);
			img.artist_idin = rs.getInt(5);
			img.yearin = rs.getInt(6);
			img.typein = rs.getString(7);
			img.widthin = rs.getInt(8);
			img.heightin = rs.getInt(9);
			img.locationin = rs.getString(10);
			img.descriptionin = rs.getString(11);
			imgList.add(img);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return imgList;
	}
	
	public List<imageDetails> getAllImagesByYearRange(int yearFrom, int yearTo) throws SQLException, IOException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select image_id, title, link, gallery_id, artist_id, year, type, width, height, location, description from image natural join detail where year >= ? AND year <= ?");
		psmt.setInt(1, yearFrom);
		psmt.setInt(2, yearTo);
		ResultSet rs = psmt.executeQuery();
		List<imageDetails> imgList = new ArrayList<imageDetails>();
		while (rs.next()) {
			imageDetails img = new imageDetails();
			img.image_id = rs.getInt(1);
			img.titlein = rs.getString(2);
			img.linkin = rs.getString(3);
			img.gallery_idin = rs.getInt(4);
			img.artist_idin = rs.getInt(5);
			img.yearin = rs.getInt(6);
			img.typein = rs.getString(7);
			img.widthin = rs.getInt(8);
			img.heightin = rs.getInt(9);
			img.locationin = rs.getString(10);
			img.descriptionin = rs.getString(11);
			imgList.add(img);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return imgList;
	}
	
	public List<imageDetails> getAllImagesByArtistName(String artName) throws SQLException, IOException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select i.image_id, i.title, i.link, i.gallery_id, i.artist_id, d.year, d.type, d.width, d.height, d.location, d.description From image as i natural join detail as d join artist as a ON (i.artist_id = a.artist_id) WHERE a.name = ?");
		psmt.setString(1, artName);
		ResultSet rs = psmt.executeQuery();
		List<imageDetails> imgList = new ArrayList<imageDetails>();
		while (rs.next()) {
			imageDetails img = new imageDetails();
			img.image_id = rs.getInt(1);
			img.titlein = rs.getString(2);
			img.linkin = rs.getString(3);
			img.gallery_idin = rs.getInt(4);
			img.artist_idin = rs.getInt(5);
			img.yearin = rs.getInt(6);
			img.typein = rs.getString(7);
			img.widthin = rs.getInt(8);
			img.heightin = rs.getInt(9);
			img.locationin = rs.getString(10);
			img.descriptionin = rs.getString(11);
			imgList.add(img);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return imgList;
	}
	
	public List<imageDetails> getAllImagesByLocation(String location) throws SQLException, IOException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select image_id, title, link, gallery_id, artist_id, year, type, width, height, location, description from image natural join detail where location = ?");
		psmt.setString(1, location);
		ResultSet rs = psmt.executeQuery();
		List<imageDetails> imgList = new ArrayList<imageDetails>();
		while (rs.next()) {
			imageDetails img = new imageDetails();
			img.image_id = rs.getInt(1);
			img.titlein = rs.getString(2);
			img.linkin = rs.getString(3);
			img.gallery_idin = rs.getInt(4);
			img.artist_idin = rs.getInt(5);
			img.yearin = rs.getInt(6);
			img.typein = rs.getString(7);
			img.widthin = rs.getInt(8);
			img.heightin = rs.getInt(9);
			img.locationin = rs.getString(10);
			img.descriptionin = rs.getString(11);
			imgList.add(img);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return imgList;
	}
	
	public imageDetails getAllDetailsByImageID(int imgID) throws SQLException, IOException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select image_id, title, link, gallery_id, artist_id, year, type, width, height, location, description from image natural join detail where image_id = ?");
		psmt.setInt(1, imgID);
		ResultSet rs = psmt.executeQuery();
		imageDetails img = new imageDetails();
		while (rs.next()) {
			img.image_id = rs.getInt(1);
			img.titlein = rs.getString(2);
			img.linkin = rs.getString(3);
			img.gallery_idin = rs.getInt(4);
			img.artist_idin = rs.getInt(5);
			img.yearin = rs.getInt(6);
			img.typein = rs.getString(7);
			img.widthin = rs.getInt(8);
			img.heightin = rs.getInt(9);
			img.locationin = rs.getString(10);
			img.descriptionin = rs.getString(11);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return img;
	}
}
