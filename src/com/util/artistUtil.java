package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class artistUtil {

	public List<artist> getAllDetailsByArtName(String artName) throws SQLException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select * from artist where name =?");
		psmt.setString(1, artName);
		ResultSet rs = psmt.executeQuery();
		List<artist> listArt = new ArrayList<artist>();
		while (rs.next()) {
			artist art = new artist();
			art.artist_id = rs.getInt(1);
			art.name = rs.getString(2);
			art.birth_year = rs.getInt(3);
			art.country = rs.getString(4);
			art.description = rs.getString(5);
			listArt.add(art);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return listArt;
	}

	public List<artist> getAllArtistByCountry(String country) throws SQLException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select * from artist where country =?");
		psmt.setString(1, country);
		ResultSet rs = psmt.executeQuery();
		List<artist> listArt = new ArrayList<artist>();
		while (rs.next()) {
			artist art = new artist();
			art.artist_id = rs.getInt(1);
			art.name = rs.getString(2);
			art.birth_year = rs.getInt(3);
			art.country = rs.getString(4);
			art.description = rs.getString(5);
			listArt.add(art);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return listArt;
	}
	
	public List<artist> getAllArtistByBirthYear(int bYear) throws SQLException {
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("select * from artist where birth_year =?");
		psmt.setInt(1, bYear);
		ResultSet rs = psmt.executeQuery();
		List<artist> listArt = new ArrayList<artist>();
		while (rs.next()) {
			artist art = new artist();
			art.artist_id = rs.getInt(1);
			art.name = rs.getString(2);
			art.birth_year = rs.getInt(3);
			art.country = rs.getString(4);
			art.description = rs.getString(5);
			listArt.add(art);
		}
		psmt.close();
		rs.close();
		System.out.println();
		return listArt;
	}
}
