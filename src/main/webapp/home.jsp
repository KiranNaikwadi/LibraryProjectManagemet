<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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
	margin-bottom:10px;
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
</style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" >
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" ></script>
     <link href="CSS/Home.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row nav-bar">
            <div class="col-12">
                <div class="row nav-bar1">

                    
                    <div class="col-md-4 col-sm-12">

                    </div>
                
                    <div class="col-md-7 col-sm-12 menus">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                         <li><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" role="link">Login</button></li> 

                           
                        <!-- Modal -->
  <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="div modal-header border-0">
            <button type="button" class="btn btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body1">
           <center>
            <form id="first-form" name="frm" action="Login" method="post">
                <h4 id="login-heading">Please login to your account</h4>
                
                <div data-mdb-input-init class="form-outline" style="margin-top:10px;">
                <label class="formlabel" for="form2Example11" style="color:black;">Username</label><br>
                  <input type="text" id="form2Example11" name="username" value="" placeholder="Enter email address" /> 
                </div>

                <div data-mdb-input-init class="form-outline" style="margin-top:20px;">
                 <label class="formlabel" for="form2Example22" style="color:black;">Password</label><br>
                  <input type="password" id="seven" name="password" value="" placeholder="Enter Password"/>
                </div><br>
                       <div class="text-center">
                  <button type="submit" class="btn btn-primary ">Login</button>
                </div>
              </form>
            </center>
             </div>
                </div>
            </div>
        </div>           -->
                    </div>
                </div>
            </div>
        </div>


        <div class="row header">
            <div class="col-md-12 col-sm-12">
                <div class="row head1">
                    <div class="col-md-4 col-sm-12  heading mt-3">
                        <h2 id="one"> Welcome! </h2><br>
                        <p  id="two">To The</p>
                        <h2>Giri's Tech-Hub Library</h2><br>
                        
                        <p id="three">Design to ease the task of Managing the Book Resources and Student Information. helpful to manage the system Centralized.</p>
                         
                    </div>


                    <div class="col-2"></div>


                    <div class="col-md-6 col-sm-12 image">
                       <img src="IMAGES/library_img.jpg" class="img-fluid" style="background-cover:cover;"> 
                        
      
                       </div>

                    
                </div>
            </div>

        </div>

        <div class="row contents">
            <div class="col-md-12 col-sm-12">
                <div class="row main-content">
                     <div class="col-md-4 col-sm-12 content1">
                        <h3>A better way to start building.</h3>
                     </div>

                    <div class="col-md-4 col-sm-12 content2">
                       <div class="row image1 mt-4">
                         <div class="col-md-12">
                             <!-- <img src="images\\message_logo.webp"> -->
                             <h4>Maintain Paperless Record</h4>
                             <p>Maintain all record without paper,directly on system.</p>
                        </div>

                        <div class="row image2 mt-4">
                            <div class="col-md-12">
                                 <!--<img src="">-->
                                 <h4>Efficiently perform all operations.</h4>
                                 <p>With the help of application efficiently manage all operations like insert,update,delete all the information.</p>
                            </div>
                        </div>
                       </div>
                    </div>

                    <div class="col-md-4 col-sm-12 content3">
                         <div class="row image3 mt-3">
                           <div class="col-md-12">
                                <!--<img src="images\\tea_logo.webp">  --> 
                                 <h4>Keeps Record Student</h4>
                                <p>Woith the help of our application you can keep all information about the students.</p>
                            </div>
 
                            <div class="row image4 mt-3">
                                 <div class="col-md-12 col-sm-12" >
                                    <!-- <img src="images\\cake_logo.webp"> --> 
                                     <h4>Manage Books Efficiently</h4>
                                     <p>With the help of our application you can manage all library operations efficiently.</p>
                                 </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>

        <div class="row about">
            <div class="col-md-12 col-sm-12">
                 <div class="row about-content1 mt-5">
                         <div class="col-md-6 col-sm-12 offset-md-3">
                            <p>The efficient library management software is essential to run smart school functions, and maintain accurate data of a library. A web-based system is more convenient than traditional desktop applications. Users can easily access the cloud or web-based application from anywhere at any time. It is also cost-effective solutions to manage burdensome library operations.</p>
                         </div>      
                 </div>

                 <div class="row about-content2">
                     <div class="col-md-12 col-sm-12">
                        <div class="row">
                             <div class="col-md-4 col-sm-3 offset-md-1 offset-sm-2">
                                <img src="IMAGES/dash_booklogoimg.png">
                             </div>
        
                             <div class="col-md-4 col-sm-2 mt-3">
                                <h6>Shreya & Manasi<span>/ </span>Developer</h6>
                             </div>
                        </div>
                     </div>

                 </div>

            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12 col-sm-12 slider">
                

                <div class="row cards">
                    <div class="col-12">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <div class="col">
                                <div class="card h-100">
                                  <img src="IMAGES/hindiimg.webp" class="card-img-top2" alt="...">
                                  <div class="card-body">
                                      <button type="button" class="btn btn-primary btn-sm mb-3">News</button>
                                    <h5 class="card-title">The last blog post title is a little bit longer tha the others</h5>
                                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than</p>
                                  </div>
                                  <div class="card-footer">
                                      <div class="row">
                                          <div class="col-3 ">
                                              <img src="" class="card_logo">
                                          </div>
                                          <div class="col-8">
                                              <div class="row">
                                                  <small class="text-body-secondary mt-1"><b>Evelyn Martinez</b></small>
                                              </div>
                                              <div class="row font">
                                                  <h6>March 12,2023-6min read</h6>
                                              </div>
                                          </div>
                                        </div>
                                  </div>
                                </div>
                              </div>
                            <div class="col">
                              <div class="card h-100">
                                <img src="IMAGES/shyamchiaai.jpg" class="card-img-top1" alt="...">
                                <div class="card-body">
                                    <button type="button" class="btn btn-primary btn-sm mb-3">Media</button>
                                  <h5 class="card-title">Another blog post title</h5>
                                  <p class="card-text">This card has supporting text below as a natural lead-in to additional content.sectetur adipisicing elit. Ipsum cum reprehenderit l lead-in to additional content. This card </p>
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-3 ">
                                            <img src="" class="card_logo">
                                        </div>
                                        <div class="col-8">
                                            <div class="row">
                                                <small class="text-body-secondary mt-1"><b>Joshiah Barclay</b></small>
                                            </div>
                                            <div class="row font">
                                                <h6>March 12,2023-6min read</h6>
                                            </div>
                                        </div>
                                      </div>
                                </div>
                              </div>
                            </div>
                            <div class="col">
                              <div class="card h-100">
                                <img src="IMAGES/atomichabit.jpg" class="card-img-top2" alt="...">
                                <div class="card-body">
                                    <button type="button" class="btn btn-primary btn-sm mb-3">News</button>
                                  <h5 class="card-title">The last blog post title is a little bit longer tha the others</h5>
                                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than</p>
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-3 ">
                                            <img src="" class="card_logo">
                                        </div>
                                        <div class="col-8">
                                            <div class="row">
                                                <small class="text-body-secondary mt-1"><b>Evelyn Martinez</b></small>
                                            </div>
                                            <div class="row font">
                                                <h6>March 12,2023-6min read</h6>
                                            </div>
                                        </div>
                                      </div>
                                </div>
                              </div>
                            </div>
                          </div>
                    </div>
                </div>
            </div>
        </div>

        

        <div class="row final_footer mt-4">
            <div class="col-md-12 col-sm-12">
                <div class="row ffooter">
                    <div class="col-md-3 col-sm-12 copyright offset-md-1 offset-sm-3 mt-4">
                        <p></p>
                    </div>

                    <div class="col-md-3 col-sm-12 ffooter1 offset-md-5 offset-sm-3 mt-4">
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Contact</a></li>
                    </div>

                </div>
            </div>
        </div>
    </div>


    
</body>
</html>
                        
                    