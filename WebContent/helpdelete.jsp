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

String dname=request.getParameter("dname");
  try{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps1=con.prepareStatement("delete from helpno where dname=?");
			ps1.setString(1,dname);
			int i=ps1.executeUpdate();
			if(i>0)
			{
			response.sendRedirect("helpline.jsp");
			}
			else
			{
				response.sendRedirect("helpline.jsp");
			}
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }
			%>
			

</body>
</html>