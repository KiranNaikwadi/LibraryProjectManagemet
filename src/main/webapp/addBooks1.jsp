<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service.*,java.util.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
<link rel="stylesheet" href="CSS/addBooks.css">
<script type="text/javascript">
 function checkBookName(str)
 {
	 let pattern=/^[a-z A-Z]+$/g;
	 let result=str.match(pattern);
		if(result!=null)
		{
			  
			 let name=document.getElementById("bookname"); 
		      name.innerHTML="valid name";
		      document.getElementById("bookname").style.color="green"
		  }
		  else{
			  
			  let name=document.getElementById("bookname"); 
		      name.innerHTML="Invalid name";
		      document.getElementById("bookname").style.color="red" 
		  } 
 }
 function checkLang(str)
 {
	 let pattern=/^[a-z A-Z]+$/g;
	 let result=str.match(pattern);
		if(result!=null)
		{
			  
			 let name=document.getElementById("booklang"); 
		      name.innerHTML="valid name";
		      document.getElementById("booklang").style.color="green"
		  }
		  else{
			  
			  let name=document.getElementById("booklang"); 
		      name.innerHTML="Invalid name";
		      document.getElementById("booklang").style.color="red" 
		  } 
 }
</script>
</head>
<body onload="hidemessage()">
<%@ include file="AdminDashboard.jsp" %>
     <div class="col py-3">
     <center>
            <div class="form-content">
               <h2>Add New Book</h2><br>
              <form name='frm' action='addBook' method='POST'>
              <table>
               <tr>
                 <td>
                  <label>Book Name:</label>
                 </td>
                 <td>
                  <input type='text' name='bookname' value='' placeholder='Enter Book Name' required style="padding:4px;"onkeyup="checkBookName(this.value)"/></br>
                   <span id="bookname"></span></br>
                 </td>
               </tr>
               <tr>
                 <td>
                   <label style="margin-right:10px;">Book Language:</label>
                 </td>
                 <td>
                   <input type='text' name='booklanguage' value='' placeholder='Enter Book Language' required style="padding:4px;"onkeyup="checkLang(this.value)"/></br>
                    <span id="booklang"></span></br>
                 </td>
                </tr>
                <tr>
                  <td>
                   <label>Author Name:</label>
                  </td>
                  <td>
                    <input type='text' name='authorname' value='' placeholder='Enter Author Name'required style="padding:4px;"onkeyup="checkAuthor(this.value)"/></br>
                     <span id="bookauthor"></span></br>
                  </td>
                </tr>
                <tr>
                 <td>
                   <label>Total Copies:</label>
                 </td>
                 <td>
                   <input type='number' name='totalcopies' value='' placeholder='select' min="1" max="10"required style="padding:4px;"onkeyup="checkCopies(this.value)"/></br>
                    <span id="bookcopies"></span></br>
                 </td>
                </tr>
                <!-- <tr>
                 <td>
                   <label id="one">Available Copies:</label>
                 </td>
                 <td>
                   <input type='number' name='avaliablecopies' class='one' value='' placeholder='select' min="1" max="10" style="padding:4px;"/></br></br>
                 </td>
                </tr> -->
                <tr>
                 <td><label>Category :</label>
                 </td>
                  <td><select name="categoryid" style="margin-bottom:20px;padding:4px;" required>
                     <option disabled selected value="">Category Name</option>
                 <%
                 CategoryService cService=new CategoryServiceImpl();
                 List<Object[]> list=cService.getAllCategory(); 
                 for(Object obj[]:list)
                 {
                 %>
                 <%-- <td><input type="radio" name="categoryid" value='<%=obj[0]%>'><%=obj[1]%> &nbsp;</td>
                  --%>
                  <option value='<%=obj[0]%>'required><%=obj[1]%> &nbsp;</option>
                  <%
                 } 
                 %>
                 </select></td>
                </tr>
                 </table>
                 <button type="submit" name="s" class="btn btn-primary">Add New Book</button>
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
     		  if (typemessage.includes("Category Added Successfully")) {
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