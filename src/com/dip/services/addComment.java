package com.dip.services;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dip.connectdb.ConnectDB;

/**
 * Servlet implementation class addComment
 */
public class addComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addComment() {
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
		

		String dname=request.getParameter("dname");
		  try{
					Connection con=ConnectDB.getConnect();
					PreparedStatement ps1=con.prepareStatement("delete from complaint where dname=?");
					ps1.setString(1,dname);
					int i=ps1.executeUpdate();
					if(i>0)
					{
					response.sendRedirect("viewComplaint.jsp");
					}
					else
					{
						response.sendRedirect("viewComplaint.jsp");
					}
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
				
					
	}

}
