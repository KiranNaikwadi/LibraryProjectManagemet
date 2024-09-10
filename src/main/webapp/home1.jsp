<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Management System</title>
</head>
<link rel="stylesheet" href="CSS/Home1.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" ></script>
    
    
    
    <!-- icons -->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <!-- icons -->
<style>

   #login-heading{
   padding-top:20px;
    color:cornflowerblue; 
   }
   button[type='submit']{
     padding:7px;
     width:90px;
     background-color:#28589c;
	color:white;
	margin-bottom:30px;
   }
   input[type='text']{
    outline:none;
    border-left: black;
    border-right: black;
    border-top:black;
    border-bottom:2px solid;
   }
  
  #first-form{
  width:100%;
  border:none;
  }
  #seven{
  outline:none;
    border-left: black;
    border-right: black;
    border-top:black;
    border-bottom:2px solid;
  }
  /* 
    @keyframes marquee {
        0% { transform: translateX(-100%); }
        100% { transform: translateX(0%); }
    }

    .marquee {
        animation: marquee 5s linear infinite;
        white-space: nowrap;
        overflow: hidden;
    }

 */
/* #about:hover .popupcard,
#about:focus .popupcard {
  transform: scale(1.1);
  
}
#about{
   transition: 0.5s;
} */
</style>

<body onload="refreshpage()">
<%session.invalidate(); %>
    <!-- navbar top -->
    
    <!-- navbar top -->

    <!-- main content -->
    <div class="container-fluid">
    <div class="main-content">
        <nav class="row navbar navbar-expand-lg" id="navbar-color">
           <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar" aria-controls="collapsibleNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            <!-- Navbar links -->
             <div class=" collapse navbar-collapse" id="collapsibleNavbar">
              <ul class="navbar-nav" style="margin-right:40px;">
              
                <li class="nav-item">
                  <a class="nav-link" href="home1.jsp?#service">Services</a>
                </li>
                <li class="nav-item">
                  <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" role="link" style="font-weight:bold;padding:2px;margin-top:5px;">Login</button>

                </li>
                <li class="nav-item">
                  <a class="nav-link" href="home1.jsp?#follow">Contact Us</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="home1.jsp?#about">About Us</a>
                </li>
                
              </ul> 
                                      <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="div modal-header border-0">
            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
        </div>
        <div class="modal-body1">
           <center>
            <form id="first-form" name="frm" action="Login" method="post">
                <h4 id="login-heading">Please login to your account</h4><br>
                
                <div data-mdb-input-init class="form-outline" style="margin-top:10px;">
                <label class="formlabel" for="form2Example11" style="color:black;">Username</label><br><br>
                  <input type="text" id="form2Example11" name="username" value="" placeholder="Enter email address" /> 
                </div>

                <div data-mdb-input-init class="form-outline" style="margin-top:20px;">
                 <label class="formlabel" for="form2Example22" style="color:black;">Password</label><br><br>
                  <input type="password" id="seven" name="password" value="" placeholder="Enter Password"/>
                </div><br>
                       <div class="text-center">
                  <button type="submit" class="btn btn-primary" style="margin-right:12px;">Login</button>
                </div>
              </form>
            </center>
             </div>
                </div>
            </div>
        </div>          
              
              
             </div>
           </div> 
          </nav>
 
 <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Your Brand</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About Us</a>
        </li>
      </ul>
    </div>
  </div>
</nav> -->
 
          <div class="content-first" >
            <div class="row content1">
            <div class="col-lg-8  col-md-12 col-sm-12 mt-5">

            <!-- </div>
            
          <div class="col-6 content" style="border:1px solid black;"> -->
            <!-- <h1>Welcome! To 
                <br> Giri's Tech Hub Library.
           <!--  </h1> -->
            <!-- <marquee behavior="scroll" direction="right" scrollamount="10" width="100%">
    <h1>Welcome! To 
                <br> Giri's Tech Hub Library.
            </h1> -->
<!-- </marquee> -->
             
             <marquee behavior="slide" direction="right" loop="1" scrollamount="15" style="width:97%"> <h1 style="  color:#121481;">Welcome! To 
                <br> Giri's Tech Hub Library.
            </h1></marquee> 
            <!-- <p>Design to ease the task of Managing the Book Resources and Student Information. <br>Also helpful to manage the system centralized.</p> -->
            <!-- <div id="btn1"><button>Shop Now</button></div> -->
          </div>
           <div class="col-4">

          </div> 
        </div>
        </div>
    </div>
    <!-- main content -->

    <!-- card1 -->
    <div class="container" id="service">
        <h1 class="text-center" style="padding-top: 30px;color:rgb(28, 28, 179)">Services We Offer</h1>
        <div class="row" style="margin-top: 50px;">
            <div class="col-lg-4 col-md-12 py-4">
                <div class="card">
                    <img src="IMAGES/managebook.jpg" alt="" class="card image-top img-fluid" style="height:275px;">
                    <div class="card-body">
                        <h4 class="card-titel text-center">Manage Books Efficiently</h4>
                        <p class="text-center">With the help of our application you can manage all library operations efficiently and manage your library effortlessly.</p><br>
                        <!-- <div id="btn2" class="text-center"><button>View More</button></div> -->
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 py-4">
                <div class="card">
                    <img src="IMAGES/students.jpg" alt="" class="card image-top" style="height:275px;">
                    <div class="card-body">
                        <h4 class="card-titel text-center">Keeps Student Record</h4>
                        <p class="text-center">With the help of our application you can keep all information about the students.Keep's monitor on each and every student effectively.</p><br>
                        <!-- <div id="btn2" class="text-center"><button>View More</button></div> -->
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 py-4">
                <div class="card">
                    <img src="IMAGES/paperless_record.jpg" alt="" class="card image-top" style="height:275px;">
                    <div class="card-body">
                        <h4 class="card-titel text-center">Maintain Paperless Records</h4>
                        <p class="text-center">Maintain all record without paper,directly on system with zero use of papers and make our world eco friendly with us. </p><br>
                       <!-- <div id="btn2" class="text-center"><button>View More</button></div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- card1 -->

    <!-- card2 -->
    <div class="container">
        
        <div class="row" style="margin-top: 100px;">
            <div class="col-md-12 col-lg-4 py-4">
                <div class="card" id="tpc">
                    <img src="IMAGES/english.jpg" alt="" class="card image-top"style="height:280px;">
                    <div class="card-img-overlay">
                        
                        
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-4 py-4">
                <div class="card" id="tpc">
                    <img src="IMAGES/allbooksimg.jpg" alt="" class="card image-top"style="height:280px;">
                    <div class="card-img-overlay">
                       
                        
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-4 py-4">
                <div class="card" id="tpc">
                    <img src="IMAGES/marathibookimg.png" alt="" class="card image-top"style="height:280px;" >
                    <div class="card-img-overlay">
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- card2 -->
    
     <!-- about -->
    <div class="container" id="about" style="margin-top:50px;">
        <h1 class="text-center" style="margin-top: 30px;color:rgb(28, 28, 179)">About Us</h1>
        
        <div class="row" style="margin-top: 30px;">
         
            <div class="popupcard col-md-12 col-sm-12">
                <div class="row about-content1 mt-3">
                      
                        <div class="col-md-2 col-sm-12 ">
                        </div>  
                        <div class="col-md-8 col-sm-12 "style="text-align:justify;">
                           <p>The efficient library management software is essential to run smart school functions, and maintain accurate data of a library. A web-based system is more convenient than traditional desktop applications. Users can easily access the cloud or web-based application from anywhere at any time. It is also cost-effective solutions to manage burdensome library operations.</p>
                        </div>
                        <div class="col-md-2 col-sm-12 ">
                        </div>
                          
                </div>

                <div class="row about-content2" >
                    <div class="col-md-12 col-sm-12">
                       <div class="row">
                           <div class="col-md-4 col-sm-1">
                           </div>
                            <div class="col-md-1 col-sm-1 mb-3">
                               <img src="IMAGES/dash_booklogoimg.png" style=" height:50px;width: 60px;">
                            </div>
       
                            <div class="col-md-4 col-sm-9 mt-3 mb3">
                               <h6>Shreya & Manasi<span>/ </span>Developer</h6>
                            </div>
                            <div class="col-md-3">

                        </div> 
                       </div>
                    </div>

                </div>

           </div>
          
        </div>
    </div>
    <!-- about -->
    <!-- card3 -->
    
    <div class="container" style="margin-top: 50px;">
                    <center><h1 style="color:rgb(28, 28, 179)">Our Customers</h1></center> 
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="3000">
                   <div class="row partion1">
                <div class="col-lg-4 col-md-6 col-sm-12 imagepart1" style="float:left;width:22%;">
                    <img src="IMAGES/adarshschoolImg.jpg" class="d-block" alt="..." style="border-radius: 50%;margin: 20px;margin-left:10px;width:230px;height:180px;">
                </div>
                <div class="col-lg-8 col-md-6 col-sm-12 textpart2" style="float:right;width:75%;padding-top: 20px;">
                <h4>Adarsh Vidhyalaya Chikhali.</h4>
                <p>One of the reputed school in maharashtra having large number of students says that we can now efficiently handle very large data because of the application and also we can keep track on each and every required thing because of this application.</p>
            </div>
        </div>
              </div>
    
    <div class="carousel-item" data-bs-interval="3000">
                <div class="row partion1">
                    <div class="col-lg-4 col-md-6 col-sm-12 imagepart1" style="float:left;width:23%;">
                        <img src="IMAGES/aec.jpg" class="d-block" alt="..." style="border-radius: 50%;margin: 20px;">
                    </div>
                    <div class="col-lg-8 col-md-6 col-sm-12 textpart2" style="float:right;width:75%;padding-top: 20px;">
                    <h4>Anuradha Engineering College.</h4>
                    <p>Anuradha Engineering college is one of the precious college in maharashtra which gives us precious feedback that with the help of our application they can efficiently work on the large scale data and it is very useful for our college.</p>
                </div>
            </div>
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                <div class="row partion1">
                    <div class="col-lg-4 col-md-6 col-sm-12 imagepart1" style="float:left;width:19%;">
                        <img src="IMAGES/giritechhublogo.png" class="d-block" alt="..." style="border-radius: 47%;margin: 20px;width:200px;height:180px;">
                    </div>
                    <div class="col-lg-8 col-md-6 col-sm-12 textpart2" style="float:right;width:75%;padding-top: 20px;">
                    <h4>Giri's Tech Hub.</h4>
                    <p>Good to have this system by which we can effeciently manage all books and the student data by which we can track all the activity perform on library.Having system to store all data and give all information within just moment without doing any tedious task</p>
                </div>
            </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
    </div>
    <!-- card3 -->

    
     
    <!-- footer -->
    <div class="row footer mt-2" id="follow">
        <h2 class="text-center">Follow Us On</h2>
        <p class="text-center">You can join our family by following us on</p>
        <div class="icons text-center">
            <!-- <i class="bx bxl-twitter"></i>
            <i class="bx bxl-facebook"></i>
            <i class="bx bxl-google"></i>
            <i class="bx bxl-skype"></i>
            <i class="bx bxl-instagram"></i> -->
            <a><img src="IMAGES/facebook_ico.webp"></a>
            <a><img src="IMAGES/twitter_ico.webp"></a>
            <a><img src="IMAGES/instagram_icon.webp"></a>
            <a><img src="IMAGES/google_icon.webp"></a>
        </div>
       
    </div>
    <!-- footer -->


</div>

</body>
</html>