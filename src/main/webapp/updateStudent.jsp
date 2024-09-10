<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="org_Library_Model.*,org_Library_Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
<link href="CSS/updateBook.css" rel="stylesheet">
</head>
<body onload="hidemessage()">
<%@include file="AdminDashboard.jsp" %>
<div class="col py-3">

 <%!StudentService stService=new StudentServiceImpl(); %>
     <center>
            <div class="form-content">
               <h2>Update Student</h2><br>
              <form name='frm' action='updateStudent' method='POST'>
              <table>
              
               <tr>
                 <td>
                  <label>Name :</label>
                 
                 </td>
                 <td>
                 <%int st_id=Integer.parseInt(request.getParameter("studentid")); %>
                  <%
            if(st_id>0)
            {
            	StudentModel stModel=new StudentModel();
            	stModel.setStudentid(st_id);
            	
                List<StudentModel> list=stService.viewStudentProfile(stModel);
                        for(StudentModel obj:list)
                        {
                       %>
              
                  <input type='text' name='studentname' value='<%=(String)obj.getStudentname() %>' placeholder='Enter Student Name'/></br></br>
                  <input type="hidden" name='studentid' value='<%=st_id %>'/>
                 </td>
               </tr>
               <tr>
                 <td>
                   <label style="margin-right:5px;">Contact :</label>
                 </td>
                 <td>
                   <input type='text' name='contact' value='<%=(String)obj.getContact() %>'  placeholder='Enter Student Contact'/></br></br>
                 </td>
                </tr>
                <tr>
                  <td>
                   <label>Email :</label>
                  </td>
                  <td>
                    <input type='text' name='email' value='<%=(String)obj.getEmail() %>' placeholder='Enter Student Email'/></br></br>
                  </td>
                </tr>
                <tr>
                 <td>
                   <label>Year :</label>
                 </td>
                 <td>
                   <input type='text' name='year' value='<%=(String)obj.getYear() %>' placeholder='Enter Study Year' /></br></br>
                 </td>
                </tr>
                <%
                }
                }
                %>
                 </table>
                 <button type="submit" name="s" class="btn btn-primary">Update Student</button>
                     <h5 id='automatic' style='text-align:center;margin-top:15px;'></h5>
              </form>
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
     		  if (typemessage.includes("Shelf Updated Successfully")) {
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