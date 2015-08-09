package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class search
 */
@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search() {
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

		// int getType = Integer.parseInt(request.getParameter("type"));
		String getType = request.getParameter("type");
		String param = new String();

		switch (getType) {
		case "1": { // type
			param = request.getParameter("ttype");
			response.sendRedirect("displayImages.jsp?type=" + 2 + "&param="
					+ param);
			break;
		}
		case "2": // year Range
		{
			String yearFrom = request.getParameter("yearFrom");
			String yearTo = request.getParameter("yearTo");
			param = yearFrom + "," + yearTo;
			response.sendRedirect("displayImages.jsp?type=" + 3 + "&param="
					+ param);
			break;
		}
		case "3": // artist name
		{
			param = request.getParameter("artName");
			response.sendRedirect("displayImages.jsp?type=" + 4 + "&param="
					+ param);
			break;
		}
		case "4": // location
		{
			param = request.getParameter("location");
			response.sendRedirect("displayImages.jsp?type=" + 5 + "&param="
					+ param);
			break;
		}
		case "5": // art country
		{
			param = request.getParameter("artCountry");
			response.sendRedirect("displayArtist.jsp?type=2&param=" + param);
			break;
		}
		case "6": // art birthyear
		{
			param = request.getParameter("artBirthYear");
			response.sendRedirect("displayArtist.jsp?type=3&param=" + param);
			break;
		}
		}
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
