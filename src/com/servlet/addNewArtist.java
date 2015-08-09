package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBUtil;
import com.util.artist;

/**
 * Servlet implementation class addNewArtist
 */
@WebServlet("/addNewArtist")
public class addNewArtist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewArtist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("art_name");
		int birth_year = Integer.parseInt(request.getParameter("birthYear"));
		String country = request.getParameter("country");
		String desc = request.getParameter("art_desc");
		
		try
		{
		Connection conn = new DBUtil().getConnectionObj();
		PreparedStatement psmt = null;
		psmt = conn.prepareStatement("insert into stars (first_name, last_name, dob, photo_url) values (?,?,?,?);");
		psmt.setString(1, name);
		psmt.setInt(2, birth_year);
		psmt.setString(3, country);
		psmt.setString(4, desc);
		int rs = psmt.executeUpdate();
		psmt.close();
		System.out.println();
		request.setAttribute("rows", rs);
		request.getRequestDispatcher("listAllArtists.jsp").forward(request, response);
		}
		catch (Exception e)
		{
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
