<%@page import="com.dip.services.GetLogin"%>
<%@ page import="com.dip.connectdb.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String cmt=request.getParameter("cmt");

String comment=request.getParameter("Comment");
  try{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps1=con.prepareStatement("update comment set dcomment=? where department=?");
			ps1.setString(1,comment);
			ps1.setString(2,GetLogin.getDname());
			
			int i=ps1.executeUpdate();
			if(i>0)
			{
			response.sendRedirect("viewUserComment.jsp");
			}
			else
			{
				response.sendRedirect("allComplaint.jsp");
			}
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }
			%>


</body>
</html>