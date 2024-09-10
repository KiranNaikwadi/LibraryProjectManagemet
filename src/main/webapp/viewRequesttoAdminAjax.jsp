<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service_User.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view request ajax</title>
<script type="text/javascript">
  function viewRequest(str)
  {
	  let xhttp=new XMLHttpRequest();
  	xhttp.onreadystatechange=function(){
  		 if(this.readyState==4 && this.status==200){
  			 document.getElementById("d").innerHTML=this.responseText;
  		 }
  	};
  	xhttp.open("GET","viewRequestSearch.jsp?n="+str,true);
  	xhttp.send();
  }
</script>
<link rel="stylesheet" href="CSS/viewBooks.css">
</head>
<body>
    <%@ include file="AdminDashboard.jsp" %>
     
  <div class="col py-3">
 <%!IssueBookService issService= new IssueBookServiceImpl(); %>
    <center>
    <h1>View Requests</h1><br>
    <input type='search' name='search' value='' placeholder='Search' style="width:30%; height:35px; outline:none;"onkeyup="viewRequest(this.value)"><br><br>
    <div id="d">
    <div class="side-content" style="overflow-y:scroll;height:300px;">
    <table>
    <thead class="position-sticky" style="top:0;position:fixed;">
    
    
    <tr>
              <th>Sr.No</th>
              <th>Student Name</th>
              <th>Book Name</th>
              <th>status</th>
              <th>Accept</th>
            </tr>
    </thead>
    <%
       List<Object[]> list=issService.viewRequest();
       if(list!=null){
    	   
       
      int count=0;
      for(Object obj[]:list)
      { 
    %>
    <tr>
    <td><%=++count %></td>
    <td><%=obj[2] %></td>
    <td><%=obj[3] %></td>
    <td><%=obj[4] %></td>
    
   <td><a href="issue_book?b_id=<%=(int)obj[1]%>&st_id=<%=(int)obj[0]%>"><button type="submit" class="btn btn-primary mb-2" style="padding:5px;background-color:green;border:none;">Accept</button></a></td>
   
    
        </tr>
 <%
      }
       }
       else{
    	   %>
      	   
     
   <center><caption><h2 style="color:navy;margin-left:290px;background-color:white;width:450px;margin-top:40px;padding:10px;">There is no request present.</h2></caption></center> 
    
    
     
   
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
