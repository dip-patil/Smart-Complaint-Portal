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
<!doctype html>
<html lang="en">
  <head>
  	<title>Sidebar 06</title>
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
	            <a href="addComplaint.html"><span class="fa fa-home mr-3"></span> Add Complaint</a>
	          </li>
	          <li>
	              <a href="viewComplaint.jsp"><span class="fa fa-user mr-3"></span>View Complaint </a>
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
       
       <head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>User Register Forms by Dip</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Comment Form</h2>
                </div>
                <div class="card-body">
                    <form action="addUserComment.jsp" method="POST">
                         
                            
                        
                        <div class="form-row">
                            <div class="name">Comment</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="Comment">
                                </div>
                            </div>
                        </div>
                        
            
                        <div>
                          <button class="btn btn--radius-2 btn--red" type="submit">Add Comment</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
        
   
        </div>
		</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
 

</body>
</html>
<%

String cmt=request.getParameter("cmt");
GetLogin.getCmt();

String comment=request.getParameter("Comment");
  try{
			Connection con=ConnectDB.getConnect();
			PreparedStatement ps1=con.prepareStatement("insert into comment values(?,?,?,?)");
			ps1.setString(1,comment);
			ps1.setString(2,cmt);
			ps1.setString(3,GetLogin.getUemail());
			ps1.setString(4,"No Comment");
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

