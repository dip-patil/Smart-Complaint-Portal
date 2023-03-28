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
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Complaint</title>
</head>
<body>
<html lang="en">
  <head>
  	<title>Complaint</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/style.css">
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="img" style="background-image: url(images/bg_1.jpg);">
				<div class="p-4">
		  		<h1><a href="index.html" class="logo">Smart <span>Complaint Portal</span></a></h1>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="addDept.html"><span class="fa fa-home mr-3"></span> Add Department</a>
	          </li>
	          <li>
	              <a href="department.jsp"><span class="fa fa-user mr-3"></span>Departments</a>
	          </li>
	          <li>
	          <a href="addRoad.html"><span class="fa fa-plane mr-3"></span>Add Road Maintanance</a>
	          </li>
	          <li>
              <a href="viewRoad.jsp"><span class="fa fa-plane mr-3"></span>View Road Task's</a>
	          </li>
	          <li>
              <a href="allComplaint.jsp"><span class="fa fa-sticky-note mr-3"></span> Complaints</a>
	          </li>
	          <li>
              <a href="helpline.jsp"><span class="fa fa-cogs mr-3"></span> Helpline Numbers</a>
	          </li>
	          <li>
              <a href="addhelpline.html"><span class="fa fa-cogs mr-3"></span>Add Helpline Numbers</a>
	          </li>
	          <li>
              <a href="index.html"><span class="fa fa-paper-plane mr-3"></span> Log Out</a>
	          </li>
	        </ul>

	        

	        <div class="footer">
	        	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by Dipkumar Patil
						</p>
	        </div>

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
        
  <body>
 <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Complaint Title</th>
      <th scope="col">Department Name</th>
      <th scope="col">Complaint Discription</th>
     <th scope="col">Address</th>
       <th scope="col">Stetus</th>
       <th scope="col">Sender</th>

       <th scope="col">Action</th>
      
      
      
    </tr>
  </thead>
  
  <%
    try
  {
    	Connection con=ConnectDB.getConnect();
		PreparedStatement ps=con.prepareStatement("select * from complaint");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			%>
			<tbody>
			
			    <tr>
			     
			      <td><%=rs.getString(1) %></td>
			     
			      <td><%=rs.getString(2) %></td>
			      <td><%=rs.getString(3) %></td>
			      
			      <td><%=rs.getString(4) %></td>
			      <td><%=rs.getString(6) %></td>
			      <td><%=rs.getString(7) %></td>
			      
			     
			      <td><a href="addComment.html?cmt=<%=rs.getString(2)%>"/a>Add Comment</td>
			      
			      
			    </tr>
    
 
		<%	
		}
		%>
		 </tbody>
       
        <%
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }
        %>
         </table>
        </body>
			
        </div>
		</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
 


</body>
</html>