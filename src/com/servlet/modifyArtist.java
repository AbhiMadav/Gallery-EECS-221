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

import org.omg.CORBA.INTERNAL;

import com.util.DBUtil;

/**
 * Servlet implementation class modifyArtist
 */
@WebServlet("/modifyArtist")
public class modifyArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyArtist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(request.getParameter("mart_id"));
		/*String name = request.getParameter("art_name");*/
		int birthyear = Integer.parseInt(request.getParameter("birthYear"));
		String country = request.getParameter("country");
		String artdesc = request.getParameter("art_desc");
		
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		try {
			psmt = conn.prepareStatement("update artist Set birth_year = ? , country = ? , description = ? where artist_id = ?");
			/*psmt.setString(1, name);*/
			psmt.setInt(1, birthyear);
			psmt.setString(2, country);
			psmt.setString(3, artdesc);
			psmt.setInt(4, id);
			int row = psmt.executeUpdate();
			request.setAttribute("rows", row);
			request.getRequestDispatcher("listAllArtists.jsp").forward(request, response);
				
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
