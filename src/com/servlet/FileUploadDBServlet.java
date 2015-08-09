package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.util.DBUtil;
import com.util.imageDetails;
/**
 * Servlet implementation class FileUploadDBServlet
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) //set max file size;
public class FileUploadDBServlet extends HttpServlet {    
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUploadDBServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//getvalues from the front end
		imageDetails img = new imageDetails();
		img.titlein = request.getParameter("titlein");
		img.gallery_idin = Integer.parseInt(request.getParameter("gallery_idin"));
		img.artist_idin = Integer.parseInt(request.getParameter("artist_idin"));
		img.yearin = Integer.parseInt(request.getParameter("yearin"));
		img.typein = (request.getParameter("typein"));
		img.yearin = Integer.parseInt(request.getParameter("yearin"));
		img.linkin = request.getParameter("linkin");// varchar(30),
		img.widthin = Integer.parseInt(request.getParameter("widthin")); // int,
		img.heightin = Integer.parseInt(request.getParameter("heightin")); // int,
		img.locationin = request.getParameter("locationin"); // varchar(30),
		img.descriptionin = request.getParameter("descriptionin"); // text,

		InputStream inputStream = null;
		String message ="";
		Part imagePart = request.getPart("photo");

		if (imagePart != null) {
			// prints out some information for debugging
			System.out.println(imagePart.getName());
			System.out.println(imagePart.getSize());
			System.out.println(imagePart.getContentType());
			// obtains input stream of the upload file
			inputStream = imagePart.getInputStream();
		}
		
		System.out.println(img.gallery_idin);
		System.out.println(img.artist_idin);
		
		java.sql.CallableStatement csmt = null;
		Connection conn = null;
		try
		{
			DBUtil db = new DBUtil();
			conn = db.getConnectionObj();
			String sqlstat = "{call insertImage (?, ?, ?, ? ,? ,?, ?, ?, ?, ?, ?, ?)}";
			csmt = conn.prepareCall(sqlstat);
			csmt.setString(1, img.titlein);
			csmt.setString(2, img.linkin);
			csmt.setInt(4, img.gallery_idin);
			csmt.setInt(5, img.artist_idin);
			csmt.setInt(6, img.yearin);
			csmt.setString(7, img.typein);
			csmt.setInt(8, img.widthin);
			csmt.setInt(9, img.heightin);
			csmt.setString(10, img.locationin);
			csmt.setString(11, img.descriptionin);
			csmt.registerOutParameter(12, java.sql.Types.INTEGER);
			
			if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                csmt.setBlob(3, inputStream);
            }
			
			csmt.executeUpdate();
            int row = csmt.getInt(12);
			if (row > 0) {
                message = "File uploaded and saved into database" + row;
            }
		}
		catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
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
         
            System.out.println(message);
    		request.getRequestDispatcher("listAllArtists.jsp").forward(request, response);
        }
	}

}
