<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org_Library_Service.*,java.util.*,org_Library_Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Category</title>
</head>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<link href="CSS/viewCategory.css" rel="stylesheet">
<body>

<div class="col py-3">
<%! 
  CategoryService categoryservice=new CategoryServiceImpl();
%>
    <center>
   
    
    <table>
    
    <tr>
    <th>Sr.no.</th>
    <th>Category</th>
    <th>Shelf</th>
    <th>Delete</th>
    <th>Update</th> 
    </tr>

    <%
    String str=request.getParameter("n");
       List<Object[]> list=categoryservice.getAllCategory(str);
       if(list!=null){
    	   
       
      int count=0;
      for(Object obj[]:list)
      { 
    %>
    <tr>
    <td><%=++count%></td>
    <td><%=obj[1]%></td>
    <td><%=obj[2]%></td>
    <td><a href='deleteCategory?categoryid=<%=(int)obj[0]%>'><img src="IMAGES/delete.png"style="width:20px;height:20px;"></a></td>
    <td><a href='updateCategory.jsp?categoryid=<%=(int)obj[0]%>'><img src="IMAGES/pen.png"style="width:20px;height:20px;"></a></td>
    
    </tr>
    <%
      }
       }
       else{
    	   %>
      	   
     
   <center><caption><h2 style="color:navy;margin-left:290px;background-color:white;width:450px;margin-top:40px;padding:10px;">There is no category present.</h2></caption></center> 
    
    
     
   
    	   <% }%>   
       
   
    </table>
    
    </center>
            
</div>
</div>
        </div>
       
        </div>
</body>
</html>