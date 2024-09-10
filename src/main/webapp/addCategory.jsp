<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org_Library_Service.*,org_Library_Model.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Category</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<link href="CSS/addCategory.css" rel="stylesheet">
<script type="text/javascript">
 function checkName(str)
 {
	 let pattern=/^[a-z A-Z]+$/g;
	 let result=str.match(pattern);
		if(result!=null)
		{
			  
			 let name=document.getElementById("automatic"); 
		      name.innerHTML="valid name";
		      document.getElementById("automatic").style.color="green"
		  }
		  else{
			  
			  let name=document.getElementById("automatic"); 
		      name.innerHTML="Invalid name";
		      document.getElementById("automatic").style.color="red" 
		  } 
 }
</script>
</head>
<body onload="hidemessage()">
<%@include file="AdminDashboard.jsp" %>
<div class="col py-3">
            <center>
            <div class="form-content">
               <h2>Add New Category</h2>
              <form name='frm' action='addCategory' method='POST'>
              <label>Category Name :</label>
              <input type="text" class='control' name='categoryname' placeholder='Enter Category Name' onkeyup="checkName(this.value)"/></br></br>
              <!-- <table style="width:90%;"> -->
              <!-- <tr> -->
              <!-- <td style="width:25%;"><label>Shelf Name :</label></td>
              <td><select name="shelf_id"> -->
              <label>Shelf Name :</label>
             <select name="shelf_id" style="margin-right:45px;padding:7px;" >
             <option disabled selected value="">Shelf Name</option>
              <% shelfService shelfservice=new shelfServiceImpl();
              List<ShelfModel> list=shelfservice.getAllShelf();
              for(ShelfModel m:list)
              {
              %>
                 <option value='<%=m.getShelfId()%>'required><%=m.getShelfName()%></option>&nbsp;
                                
                <%--  <td><input type='radio' name='shelf_id' value='<%=m.getShelfId()%>'required><%=m.getShelfName()%>&nbsp;</td> --%>
                 <%
                 }
                 %>
                  </select><br><!-- </td>
                 </tr>
                 </table> -->
                 <button type="submit" class="btn btn-primary mb-2">Add New Category</button>
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