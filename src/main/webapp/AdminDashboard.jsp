<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="org_Library_Controller.*,org_Library_Service.*,org_Library_Model.*,java.util.*" %>
<%
// Check if the session exists and contains the user attribute
HttpSession existingSession = request.getSession(false);
if(existingSession == null || existingSession.getAttribute("admin_id") == null) {
    // If session or user attribute does not exist, redirect to login page
    response.sendRedirect("home1Page.jsp");
    return;
}
// If user is logged in, retrieve the username from the session
int id = (int) existingSession.getAttribute("admin_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="CSS/admindashboard.css" rel="stylesheet">


<style>
.nav-bar
{
     background-color: rgb(209 234 250); 
     background-color:cornflowerblue;   
     
     line-height: 40px;
	font-size: 20px;
	
	color:white;
}
.nav-bar li a
{   color:white;
  text-decoration: none;
  
}
.nav-bar li
{   color:white;
    list-style-type: none;
    
}
/* .nav-bar1 li
{   color:white;
    display: inline;
    
 
    
}
.nav-bar{


} */

#first{
text-decoration:none;
padding:9px;
padding-left:5px;
 padding-right: 75px; 
border-radius:5px;
}
#first:hover{

background-color: #41C9E2;
}
</style>
</head>
<body onload="refreshPage()">
 <%-- <%session.invalidate(); %> --%>
<div class="container-fluid">
       <div class="row nav-bar">
            
               
                
                    <div class="col-12 col-sm-12 menus">
                    <ul style="display:flex;list-style-type:none;justify-content: flex-end;gap:60px;padding-top:10px;">
                        <li><a href="home1.jsp">Home</a></li>
                        <li><a href="home1.jsp?#about">About Us</a></li>
                        <li><a href="#">Contact Us</a></li>
                         <li><a href="adminLogout"style="padding-right:20px;">Logout</a></li> 
                       </ul>
                           
                      
                 
                </div>
           
        </div>

        <div class="row flex-nowrap">
            <div class="part1  col-lg-2 col-md-3">
             
                <div class="menu d-flex flex-column  align-items-sm-start px-3 pt-2 ">
                    
                       <!--  <center><span><h3 style="margin-left:65px;">Menu</h3></span></center> -->
                       <% StudentService stService1=new StudentServiceImpl();
                       String name=stService1.getNameBySId(id);
                       %>
                       <h4>Welcome <%=name %> !</h4>
                       
                        <center><span><h3>Menu</h3></span></center>
                    
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-sm-start mt-4" id="menu" style="width:220px;margin-right:10px;">
                         
                      
                            
                            <!-- <a href="" id="first"></i> <span class="ms-1 d-none d-sm-inline"><img src="IMAGES/profile.png" style="width:30px;height:30px;margin-right:10px;">My Profile</span></a> -->
                            
                            <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            
                                <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline" style="padding-top:5px;padding-right:80px;"><img src="IMAGES/bookshelf.webp" style="width:30px;height:30px;margin-right:10px;">Book Shelf</span></a>
                             
                                <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                                <li class="w-100">
                                    <a href="addShelf.jsp" class="nav-link px-0"> <span class="d-subnone d-sm-inline">Add Book Shelf</span></a>
                                </li>
                                <li class="w-100">
                                    <a href="viewShelf.jsp" class="nav-link px-0"> <span class="d-subnone d-sm-inline">View Book Shelf</span></a>
                                </li>
                                
                              </ul>
                     
             
                       
                            <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            
                                <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline"style="padding-top:5px;padding-right:42px;"><img src="IMAGES/bookcategory.png" style="width:30px;height:30px;margin-right:10px;">Book Category</span> </a>
                                <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                                <li class="w-100">
                                    <a href="addCategory.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Add Category</span></a>
                                </li>
                                <li class="w-100">
                                    <a href="viewCategory.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">View Category</span></a>
                                </li>
                            </ul>
                        
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline"style="padding-top:5px;padding-right:20px;"><img src="IMAGES/bookinfologo.png" style="width:30px;height:30px;margin-right:10px;">Book Information</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="addBooks1.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Add New Book</span></a>
                            </li>
                            <li class="w-100">
                                <a href="viewBooks.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">View All Books</span></a>
                            </li>
                        </ul>
                    
                    <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            
                        <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline text-white"style="padding-top:5px;padding-right:35px;"><img src="IMAGES/studentinfologo.webp" style="width:35px;height:30px;margin-right:10px;">Student Details</span> </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu4" data-bs-parent="#menu">
                        <li class="w-100">
                            <a href="addStudent.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Add Student</span></a>
                        </li>
                        <li class="w-100">
                            <a href="viewStudent.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">View Student</span></a>
                        </li>
                         <li class="w-100">
                            <a href="viewRequesttoAdminAjax.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">View request</span></a>
                        </li>
                         <li class="w-100">
                            <a href="viewStudentForReturnBookAjax.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Return Book</span></a>
                        </li>
                        <li class="w-100">
                            <a href="checkStatusByAdminAjax.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Check Status</span></a>
                        </li>
                    </ul>
                <!-- </li>
                            <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                                <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">Bootstrap</span></a>
                            <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                                <li class="w-100">
                                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 1</a>
                                </li>
                                <li>
                                    <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">Item</span> 2</a>
                                </li>
                            </ul>
                        </li>-->
                        
                    
                   <!-- 
                     <li class="sidebar-item"><a href="#"
							class="sidebar-link has-dropdown collapsed"
							data-bs-toggle="collapse" data-bs-target="#auth"
							aria-expanded="false" area-controls="auth"> <img
								src="img/graduated.png" alt=""> <span>studentMaster</span>
						</a>
							<ul id="auth" class="sidebar-dropdown list-unstyled collapse"
								data-bs-parent="#sidebar">
								<li class="sidebar-item"><a href="AddStudent.jsp">New Student</a></li>
								<li class="sidebar-item"><a href="ViewStudent.jsp">View</a></li>
							</ul></li>  -->
							</ul>
                </div>
              
            </div>
            <div class="col-lg-10 col-md-9 content-area">
                
              
 
</body>
</html>