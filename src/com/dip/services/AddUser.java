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
 * Servlet implementation class AddUser
 */
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
		String name=request.getParameter("Name");
		String uemail=request.getParameter("Email");
		String upass=request.getParameter("Password");
		String cont=request.getParameter("Contact");
		String addr=request.getParameter("Address");
		
		try
		{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, cont);
			ps.setString(3, uemail);
			ps.setString(4, upass);
			ps.setString(5, addr);
			
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("userLogin.html");
			}
			else
			{
				response.sendRedirect("addUser.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
