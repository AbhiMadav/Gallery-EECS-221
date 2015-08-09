package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBUtil;

/**
 * Servlet implementation class modifyGallery
 */
@WebServlet("/modifyGallery")
public class modifyGallery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyGallery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		try {
			psmt = conn.prepareStatement("update gallery Set name = ?,  description = ? where gallery_id = ?");
			psmt.setString(1, request.getParameter("mgallery_name").toString());
			psmt.setString(2, request.getParameter("mgallery_desc").toString());
			String gallery_id = request.getParameter("mgallery_id");
			psmt.setInt(3, Integer.parseInt(gallery_id));
			int row = psmt.executeUpdate();
			request.setAttribute("rows", row);
			request.getRequestDispatcher("listAllGalleries.jsp").forward(request, response);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
