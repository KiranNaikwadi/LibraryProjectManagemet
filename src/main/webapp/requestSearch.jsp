<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="org_Library_Service.*,java.util.*,org_Library_Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Request search</title>
<script type="text/javascript">
  function searchByBookAttribute(str)
  {
	  let xhttp=new XMLHttpRequest();
  	xhttp.onreadystatechange=function(){
  		 if(this.readyState==4 && this.status==200){
  			 document.getElementById("d").innerHTML=this.responseText;
  		 }
  	};
  	xhttp.open("GET","viewStudentForIssueBookSearch.jsp?n="+str,true);
  	xhttp.send();
  }
</script>
<link rel="stylesheet" href="CSS/viewBooks.css">
</head>
<body>
  <%@ include file="AdminDashboard.jsp" %>
     <div class="col py-3">
       <center>
         <div class="whole table">
          <h1>Student Details</h1><br></br>
          <input type='search' name='search' value='' placeholder='Search' style="width:30%; height:35px; outline:none;" onkeyup="searchByBookAttribute(this.value)"><br>
          <div id="d">
          <div class="only-table" style="overflow-y:scroll;height:200px;">
          <table>
          <thead class="position-sticky" style="top:0;">
            <tr>
              <th>Sr.No</th>
              <th>Sudent Name</th>
              <th>Student Contact</th>
              <th>Student Email</th>
              <th>Student Year</th>
              <th>Return Book</th>
            </tr>
            </thead>
            <%
            StudentService stService=new StudentServiceImpl();
            List<StudentModel> list=stService.getAllStudent();
            if(list!=null)
            {
          	  int count=0;
                for(StudentModel obj:list)
                {
            %>
            <tr>
              <td style="background-color:white;"><%=++count %></td>
              <td style="background-color:white;"><%=obj.getStudentname() %></td>
              <td style="background-color:white;"><%=obj.getContact() %></td>
              <td style="background-color:white;"><%=obj.getEmail() %></td>
              <td style="background-color:white;"><%=obj.getYear() %></td>
              <td style="background-color:white;"><a href="returnBook.jsp?st_id=<%=(int)obj.getStudentid()%>"><button type="submit" class="btn btn-primary mb-2" style="padding:5px;background-color:green;border:none;">Return Book</button></a></td>
            </tr>
            <%

                }
             }
       %>
          </table>
          </div>
          </div>
         </div>
       </center>
     </div>
    </div>
   </div>
  </div>
</body>
</html>
