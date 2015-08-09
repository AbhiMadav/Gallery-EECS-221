package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.Location;
import com.util.DBUtil;
import com.util.imageDetails;

/**
 * Servlet implementation class modifyImage
 */
@WebServlet("/modifyImage")
public class modifyImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public modifyImage() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		imageDetails img = new imageDetails();
		img.image_id = Integer.parseInt(request.getParameter("image_id"));
		img.titlein = request.getParameter("title");
		img.yearin = Integer.parseInt(request.getParameter("year"));
		img.typein = request.getParameter("img_type");
		img.locationin = request.getParameter("img_location");
		img.descriptionin = request.getParameter("image_desc");

		java.sql.CallableStatement csmt = null;
		Connection conn = null;
		try {
			DBUtil db = new DBUtil();
			conn = db.getConnectionObj();
			String sqlstat = "{call modifyimage (?, ?, ?, ? ,? ,?, ?)}";
			csmt = conn.prepareCall(sqlstat);
			csmt.setInt(1, img.image_id);
			csmt.setString(2, img.titlein);
			csmt.setInt(3, img.yearin);
			csmt.setString(4, img.typein);
			csmt.setString(5, img.locationin);
			csmt.setString(6, img.descriptionin);
			csmt.registerOutParameter(7, java.sql.Types.INTEGER);

			csmt.executeUpdate();

		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
		request.getRequestDispatcher("listAllGalleries.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
