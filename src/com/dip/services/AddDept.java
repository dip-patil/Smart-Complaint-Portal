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
 * Servlet implementation class AddDept
 */
public class AddDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDept() {
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
		String email=request.getParameter("Email");
		String pass=request.getParameter("Password");
		String tal=request.getParameter("Taluka");
		String dist=request.getParameter("District");
		String cont=request.getParameter("Contact");
		String addr=request.getParameter("Address");

		
		try
		{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps=con.prepareStatement("insert into department values(?,?,?,?,?,?,?)");
			ps.setString(1, email);
			ps.setString(2, pass);
			ps.setString(3, dname);
			ps.setString(4, tal);
			ps.setString(5, dist);
			ps.setString(6, addr);
			ps.setString(7, cont);
			
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("department.jsp4");
			}
			else
			{
				response.sendRedirect("addDept.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
