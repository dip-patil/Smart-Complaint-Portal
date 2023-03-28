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
 * Servlet implementation class AddComp
 */
public class AddComp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComp() {
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
		String title=request.getParameter("CompTitle");
		String dis=request.getParameter("CompDiscription");
		String addr=request.getParameter("Address");
		String date=request.getParameter("Date");
	//	String img=request.getParameter("Image");
	//	String cmt=request.getParameter("Comment");
		

		
		try
		{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps=con.prepareStatement("insert into complaint values(?,?,?,?,?,?,?)");
			ps.setString(1, title);
			ps.setString(2, dname);
			ps.setString(3, dis);
			ps.setString(4, addr);
			ps.setString(5, date);
			//ps.setString(6, img);
			ps.setString(6, "Pending");
			ps.setString(7, GetLogin.getUemail());
			
			
			
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("viewComplaint.jsp");
			}
			else
			{
				response.sendRedirect("addComplaint.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
