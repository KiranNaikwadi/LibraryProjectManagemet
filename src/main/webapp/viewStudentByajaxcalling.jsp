<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org_Library_Service.*,java.util.*,org_Library_Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Student</title>
<link href="CSS/viewStudent.css" rel="stylesheet">

</head>

<body>
<%-- <%@include file="AdminDashboard.jsp"%> --%>
<div class="col py-3">
<%!StudentService studentservice=new StudentServiceImpl(); %>
    <center>
    <!-- <h1>View Student</h1><br> -->
    
   
    <div class="side-content">
    <table>
    <thead>
    <tr>
    
    <th  style="width:50px;">Sr.no.</th>
    <th>Student Name</th>
    <th>Student Contact</th>
    <th>Student Email</th>
    <th>Student Year</th>
    <th style="width:80px;">Delete</th>
    <th style="width:80px;">Update</th> 
   
    </tr>
    </thead>
    <%String str=request.getParameter("n");
      List<StudentModel> list=studentservice.searchStudentByAttribute(str);
      if(list!=null){
    	int count=0; 
      for(StudentModel m:list){
   %>
    <tr>
    
    <td><%=++count %></td>
    <td><%= m.getStudentname()%></td>
    <td><%=m.getContact()%></td>
    <td><%=m.getEmail()%></td>
    <td><%=m.getYear()%></td>
    <td><a href='deleteStudent?studentid=<%=m.getStudentid()%>'><img src="IMAGES/delete.png"style="width:20px;height:20px;"></a></td>
    <td><a href='updateStudent.jsp?studentid=<%=m.getStudentid()%>'><img src="IMAGES/pen.png"style="width:20px;height:20px;"></a></td>
    
    </tr>
    <%
      }
      }
      else{
    %>
      <center><caption><h2 style="color:navy;margin-left:290px;background-color:white;width:450px;margin-top:40px;padding:10px;">There is no student present.</h2></caption></center> 
    
           <%}
      %>
      
    </table>
     </div>
    
    </center>
            
</div>
</div>
        </div>
      
        </div>
</body>
</html>