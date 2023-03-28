package com.dip.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dip.connectdb.ConnectDB;

/**
 * Servlet implementation class DeptLogin
 */
public class DeptLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptLogin() {
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
		String demail=request.getParameter("Email");
		String dpass=request.getParameter("Password");
		
		try
		{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps=con.prepareStatement("select * from department where email=? and password=?");
			ps.setString(1, demail);
			ps.setString(2, dpass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				GetLogin.setDname(rs.getString(3));
				response.sendRedirect("deptInterface.html");
			}
        	else
			{
				response.sendRedirect("index.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
