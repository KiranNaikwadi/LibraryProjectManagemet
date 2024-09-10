<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org_Library_Controller.*,org_Library_Service.*,org_Library_Model.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="CSS/admindashboard.css" rel="stylesheet">
<%!int s_id; %>
    <%
    HttpSession existingSession=request.getSession(false);
    if((existingSession==null)||(existingSession.getAttribute("user_id")==null))
    {
    	response.sendRedirect("home1.jsp");
    }
    else
    {
        s_id = (int) existingSession.getAttribute("user_id");
    }
    %>
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
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                         <li><a href="userLogout" style="padding-right:20px;">Logout</a></li> 
                       </ul>
                           
                      
                 
                </div>
           
        </div>
        <div class="row flex-nowrap">
            <div class="part1  col-lg-2 col-md-3">
                <div class="menu d-flex flex-column  align-items-sm-start px-3 pt-2 ">
                    
                     <!--    <center><span><h3 style="margin-left:65px;">Menu</h3></span></center> -->
                    <% 
                           StudentService stService1=new StudentServiceImpl();
                           String st_name=stService1.getNameById(s_id);
                          %> <br> 
                        <center><h5  style="margin-left:25px;">Welcome <%=st_name %> !</h5> </center>              
                       <center><span><h3 style="margin-left:65px;">Menu</h3></span></center>  
                    
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-sm-start mt-4" id="menu"style="width:220px;margin-right:10px;">
                        
                      
                           <a href="studentProfile1.jsp" id="first"></i> <span class="ms-1 d-none d-sm-inline"><img src="IMAGES/profile.png" style="width:30px;height:30px;margin-right:10px;">My Profile</span></a>
                           
                            <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            
                                <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline texr-white" style="padding-left:5px;padding-right:10px;"><img src="IMAGES/bookinfologo.png" style="width:30px;height:30px;margin-right:10px;">Book Information</span> </a>
                                <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                                <li class="w-100">
                                    <a href="viewBookstoStudent.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">View All Books</span></a>
                                </li>
                                
                                <li class="w-100">
                                    <a href="requestforBookAjax.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline text-white">Issue Books</span></a>
                                </li>
                                 
                            </ul>
                    
                    
                            <data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            
                                <a href="checkStatus.jsp" style="text-decoration:none;padding-left:5px;padding-right:50px;"><i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline"><img src="IMAGES/check_statusLogo.png" style="width:35px;height:30px;margin-right:10px;">Check Status</span></a>
                           </data-bs-toggle>
                           </ul>
                </div>
            </div>
             <div class="col-lg-10 col-md-9 content-area">
                
              
 
</body>
</html>