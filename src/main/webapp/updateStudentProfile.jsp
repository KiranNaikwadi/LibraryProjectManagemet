<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="org_Library_Model.*,org_Library_Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/addStudent.css">
<title>Update Student Information</title>
<script type="text/javascript">
 function checkName(str)
 {
	 let pattern=/^[a-z A-Z]+$/g;
	 let result=str.match(pattern);
		if(result!=null)
		{
			  
			 let name=document.getElementById("studname"); 
		      name.innerHTML="valid name";
		      document.getElementById("studname").style.color="green"
		  }
		  else{
			  
			  let name=document.getElementById("studname"); 
		      name.innerHTML="Invalid name";
		      document.getElementById("studname").style.color="red" 
		  } 
 }
 function checkYear(str)
 {
	 let pattern=/^[a-z A-Z]+$/g;
	 let result=str.match(pattern);
		if(result!=null)
		{
			  
			 let name=document.getElementById("studyear"); 
		      name.innerHTML="valid year";
		      document.getElementById("studyear").style.color="green"
		  }
		  else{
			  
			  let name=document.getElementById("studyear"); 
		      name.innerHTML="Invalid year";
		      document.getElementById("studyear").style.color="red" 
		  } 
 }
 function checkEmail(str)
 {
	 let pattern=/^[a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,3}$/g;
	 let result=str.match(pattern);
		if(result!=null)
		{
			  
			 let name=document.getElementById("studemail"); 
		      name.innerHTML="valid email";
		      document.getElementById("studemail").style.color="green"
		  }
		  else{
			  
			  let name=document.getElementById("studemail"); 
		      name.innerHTML="Invalid email";
		      document.getElementById("studemail").style.color="red" 
		  } 
 }
 function checkContact(str)
 {
	 let pattern=/^[0-9]+$/g;
	 let result=str.match(pattern);
		if(result!=null)
		{
			  
			 let name=document.getElementById("studcontact"); 
		      name.innerHTML="valid contact";
		      document.getElementById("studcontact").style.color="green"
		  }
		  else{
			  
			  let name=document.getElementById("studcontact"); 
		      name.innerHTML="Invalid contact";
		      document.getElementById("studcontact").style.color="red" 
		  } 
 }
</script>
</head>
<body onload="hidemessage()">
 <%@ include file="studentDashboard.jsp" %>
 <%!StudentService stService=new StudentServiceImpl(); %>
    <div class="col py-3">
      <center>
            <div class="form-content">
             <h2>Update Student</h2><br>
              <form name='frm' action='updateStudentProfile' method='POST'>
            <%int st_id=Integer.parseInt(request.getParameter("st_id")); %>
                 <input type='hidden' name='st_id' value='<%=st_id%>'>
            <%
            if(st_id>0)
            {
            	StudentModel stModel=new StudentModel();
            	stModel.setStudentid(st_id);
            	
                List<StudentModel> list=stService.viewStudentProfile(stModel);
                        for(StudentModel obj:list)
                        {
                       %>
              
              <table>
               <tr>
                 <td>
                  <label>Name:</label>
                 </td>
                 <td>
                  <input type='text' name='st_name' class='' value='<%=(String)obj.getStudentname() %>' onkeyup="checkName(this.value)" required/></br>
                  <span id="studname"></span></br>
                 </td>
               </tr>
               <tr>
                 <td>
                   <label id='one'>Contact: </label>
                 </td>
                 <td>
                   <input type='text' name='st_contact' class='' value='<%=(String)obj.getContact() %>'  placeholder='Enter Contact' onkeyup="checkContact(this.value)" required/></br>
                   <span id="studcontact"></span></br>
                 </td>
                </tr>
                <tr>
                  <td>
                   <label>Email:</label>
                  </td>
                  <td>
                    <input type='email' name='st_email' value='<%=(String)obj.getEmail() %>' onkeyup="checkEmail(this.value)" required/></br>
                      <span id="studemail"></span></br>
                  </td>
                </tr>
                <tr>
                 <td>
                   <label>Year:</label>
                 </td>
                 <td>
                   <input type='text' name='st_year' class='' value='<%=(String)obj.getYear() %>' onkeyup="checkYear(this.value)" required /></br>
                    <span id="studyear"></span></br>
                 </td>
                 
                </tr>
                 </table>
                 <button type="submit" name="s" class="btn btn-primary">Update</button><br>
                 <h5 id='automatic' style='text-align:center;margin-top:15px;'></h5>
              </form>
              <%   
                        }
            }
             %>
            </div>
        </center>
    </div>
   </div>
  </div>
 </div>
 
 <%
    String msg=(String) request.getAttribute("msg");
    if(msg!=null)
    {
  %>
   <script>
    function hidemessage()
    {
    	var hideElement=document.getElementById("automatic");
    	var originalText=hideElement.innerHTML;
    	var typemessage="<%=msg%>";
    	if(typemessage)
    		{
    		  hideElement.innerHTML=typemessage;
     		  if (typemessage.includes("Updated Successfully")) {
   	            hideElement.style.color = "green"; // Green color for success message
    	        } else {
    	            hideElement.style.color = "red"; // Red color for failure message
     	        }
    		  setTimeout(function(){hideElement.innerHTML=originalText;},3000);
    		}
    }
   </script>
  <%
    }
  %>
</body>
</html>