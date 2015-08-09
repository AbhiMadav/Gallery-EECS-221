package com.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class populateFields {

	public Map<Integer, artist> getArtistMap() throws SQLException {
		Statement st = new DBUtil().getConnectionObj().createStatement();
		ResultSet rs = st.executeQuery("select * from artist");
		//List<artist> artlist = new ArrayList<artist>();
		int i=1;
		Map<Integer, artist> artMap = new HashMap<Integer, artist>();
		while (rs.next()) {
			//artlist.add(new artist(rs.getInt(1), rs.getString(2)));
			int index = rs.getInt(1);
			String artName = rs.getString(2);
			if(!artMap.containsValue(artName))
				artMap.put(index, new artist(index, artName, rs.getInt(3), rs.getString(4), rs.getString(5)));
		}
		st.close();
		rs.close();
		return artMap;
	}
	
	public List<gallery> getGalleryList() throws SQLException {
		Statement st = new DBUtil().getConnectionObj().createStatement();
		ResultSet rs = st.executeQuery("select * from gallery");
		List<gallery> gallist = new ArrayList<gallery>();
		while (rs.next()) {
			gallist.add(new gallery(rs.getInt(1), rs.getString(2), rs.getString(3)));
		}
		st.close();
		rs.close();
		return gallist;
	}
}
