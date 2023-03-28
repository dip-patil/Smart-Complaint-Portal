package com.dip.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dip.connectdb.ConnectDB;

/**
 * Servlet implementation class addRoad
 */
public class addRoad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRoad() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String dname=request.getParameter("Dname");
		
		String rname=request.getParameter("Rname");
		String loc=request.getParameter("Location");
		String date=request.getParameter("Ddate");
	
		

		
		try
		{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps=con.prepareStatement("insert into roaddepartment values(?,?,?,?,?)");
			ps.setString(1, rname);
			ps.setString(2, loc);
			ps.setString(3, dname);
			
			ps.setString(4, date);
			ps.setString(5, "Pending");
		
			
			
			
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("viewRoad.jsp");
			}
			else
			{
				response.sendRedirect("adminInterface.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
