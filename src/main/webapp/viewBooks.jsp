<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org_Library_Service.*,java.util.*,org_Library_Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>

<link href="CSS/viewBooks.css" rel="stylesheet">
<script type="text/javascript">
  function searchByBookAttribute(str)
  {
	  let xhttp=new XMLHttpRequest();
  	xhttp.onreadystatechange=function(){
  		 if(this.readyState==4 && this.status==200){
  			 document.getElementById("d").innerHTML=this.responseText;
  		 }
  	};
  	xhttp.open("GET","searchByBookAttribute.jsp?n="+str,true);
  	xhttp.send();
  }
</script>

</head>
<body>
<%@include file="AdminDashboard.jsp"%>
<div class="col py-3">
<%! BookService bookservice=new BookServiceImpl(); %>
    <center>
    <h1>View Books</h1><br>
    <input type='search' name='search' value='' placeholder='Search' style="width:30%; height:35px; outline:none;" onkeyup="searchByBookAttribute(this.value)"><br><br>
    <div id="d">
    <div class="side-content" style="overflow-y:scroll;height:300px;">
    <table>
    <thead class="position-sticky" style="top:0;position:fixed;">
    
    
    <tr>
    <th>Sr.no.</th>
    <th>Book Name</th>
    <th>Book Language</th>
    <th>Book Author</th>
    <th>Total Copies</th>
    <th>Available Copies</th>
    <th>Category Name</th>
    <th>Delete</th>
    <th>Update</th> 
    </tr>
    </thead>
    <%
       List<Object[]> list=bookservice.getAllBooks();
       if(list!=null){
    	   
       
      int count=0;
      for(Object obj[]:list)
      { 
    %>
    <tr>
    <td><%=++count %></td>
    <td><%=obj[1] %></td>
    <td><%=obj[2] %></td>
    <td><%=obj[3] %></td>
    <td><%=obj[4] %></td>
    <td><%=obj[5] %></td>
    <td><%=obj[7] %></td>
    <td><a href='deleteBook?bookid=<%=(int)obj[0]%>'><img src="IMAGES/delete.png"style="width:20px;height:20px;"></a></td>
    <td><a href='updateBook.jsp?bookid=<%=(int)obj[0]%>'><img src="IMAGES/pen.png"style="width:20px;height:20px;"></a></td>
    
    </tr>
 <%
      }
       }
       else{
    	   %>
      	   
     
   <center><caption><h2 style="color:navy;margin-left:290px;background-color:white;width:450px;margin-top:40px;padding:10px;">There is no book present.</h2></caption></center> 
    
    
     
   
    	   <% }%>   
       
    </table>
     </div> 
     </div>
    </center>
          
</div>
</div>
        </div>
       
        </div>
</body>
</html>
