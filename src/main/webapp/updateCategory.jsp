<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="org_Library_Model.*,org_Library_Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Category</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<link href="CSS/updatecategory.css" rel="stylesheet">
</head>
<body onload="hidemessage()">
<%@include file="AdminDashboard.jsp" %>
<div class="col py-3">
<%! CategoryService catservice=new CategoryServiceImpl(); %>
            <center>
            <div class="form-content">
               <h2>Update Category</h2>
              <form name='frm' action='updateCategory' method='POST'>
              
              <label>Category Name :</label>
              <%int cid=Integer.parseInt(request.getParameter("categoryid"));
              %>
                 <input type="hidden" name='categoryid' value='<%=cid%>'/>
              <% 
              if(cid>0){  
              CategoryModel catmodel =new CategoryModel();
              catmodel.setCatid(cid);
              List<CategoryModel> list1=catservice.viewCategoryDetails(catmodel);
              for(CategoryModel obj:list1){
            	  
              %>
               
                 <input type="text" name='categoryname' value='<%=(String)obj.getCatname()%>' required/></br></br>
              
                 <button type="submit" class="btn btn-primary mb-2">Update Category</button>
                 <h5 id='automatic' style='text-align:center;margin-top:15px;'></h5>
                
                 <%}
              }
              %>
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
     		  if (typemessage.includes("Category Updated Successfully")) {
   	            hideElement.style.color ="green"; // Green color for success message
    	        } else {
    	            hideElement.style.color ="red"; // Red color for failure message
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