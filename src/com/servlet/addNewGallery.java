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
 * Servlet implementation class addNewGallery
 */
@WebServlet("/addNewGallery")
public class addNewGallery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewGallery() {
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
			psmt = conn.prepareStatement("insert into gallery (name, description) values (?,?)");
			psmt.setString(1, request.getParameter("gallery_name").toString());
			psmt.setString(2, request.getParameter("gallery_desc").toString());
			
			int row = psmt.executeUpdate();
			request.setAttribute("rows", row);
			request.getRequestDispatcher("listAllGalleries.jsp").forward(request, response);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
