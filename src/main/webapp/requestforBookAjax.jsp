<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Request for Book Ajax</title>
<script type="text/javascript">
  function searchByBookAttribute(str)
  {
	  let xhttp=new XMLHttpRequest();
  	xhttp.onreadystatechange=function(){
  		 if(this.readyState==4 && this.status==200){
  			 document.getElementById("d").innerHTML=this.responseText;
  		 }
  	};
  	xhttp.open("GET","requestforBookSearchStudent.jsp?n="+str,true);
  	xhttp.send();
  }
</script>
<link rel="stylesheet" href="CSS/viewBooks.css">
</head>
<body>
   <%@ include file="studentDashboard.jsp" %>
     <div class="col py-3">
       <center>
         
          <h1>Books Details</h1><br></br>
          <input type='search' name='search' value='' placeholder='Search' style="width:30%; height:35px; outline:none;" onkeyup="searchByBookAttribute(this.value)"><br>
          <div id="d">
         <br>
           <div class="only-table" style="overflow-y:scroll;height:350px;">
          <table>
          <thead class="position-sticky" style="top:0;">
            <tr>
              <th>Sr.No</th>
              <th>Book Name</th>
              <th>Book Language</th>
              <th>Book Author</th>
              <th>Available Copies</th>
              <th>Category Name</th>
              <th>Issue Book</th>
            </tr>
            </thead>
            <%
            int st_id=Integer.parseInt(session.getAttribute("user_id").toString());
           
            BookService bService=new BookServiceImpl();
            List<Object[]> list=bService.getAllBooks();
            int count=0;
            for(Object obj[]:list)
            {
            %>
            <tr>
              <td style="background-color:white;"><%=++count%></td>
              <td style="background-color:white;"><%=obj[1]%></td>
              <td style="background-color:white;"><%=obj[2]%></td>
              <td style="background-color:white;"><%=obj[3]%></td>
              <td style="background-color:white;"><%=obj[5]%></td>
              <td style="background-color:white;"><%=obj[7]%></td>
              <td style="background-color:white;"><a href="requestForBook?b_id=<%=(int)obj[0]%>&st_id=<%=st_id%>"><button type="submit" class="btn btn-primary mb-2" style="padding:5px;background-color:green;border:none;">Issue Book</button></a></td>
            </tr>
            <%
            }
       %>
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

