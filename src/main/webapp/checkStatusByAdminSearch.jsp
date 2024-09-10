<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service.*,java.util.*,org_Library_Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>check status search</title>
<style>
   table
 {
  margin-top:30px;
 }
 
table tr:hover{
	border:1px solid black;
	padding:10px;
	background-color: #E0F4FF;
}                  
</style>
<link rel="stylesheet" href="CSS/viewBooks.css">
</head>
<body>

          <div class="col py-3">
            <center>
           <br>
            <table>
               <tr>
              <th>Sr.No</th>
              <th>Student Name</th>
              <th>Student Contact</th>
              <th>Student Email</th>
              <th>Student Year</th>
              <th>Check Status</th>
            </tr>
               <%
               String str=request.getParameter("n");
               StudentService stService=new StudentServiceImpl();
               List<StudentModel> list1=stService.searchStudentByAttribute(str);
               if(list1!=null)
               {
                 int count=0;
                 for(StudentModel obj:list1)
                  {
               %>
              <tr>
              <td><%=++count%></td>
              <td><%=obj.getStudentname()%></td>
              <td><%=obj.getContact()%></td>
              <td><%=obj.getEmail()%></td>
              <td><%=obj.getYear()%></td>
              <td><a href="viewStudentStatusByAdmin.jsp?st_id=<%=obj.getStudentid()%>"><button type="submit" class="btn btn-primary mb-2" style="padding:5px;background-color:green;border:none;">Check Status</button></a></td>
            </tr>
               <%
               }
               }
               
               else{
               %>
                <center><caption><h2 style="color:navy;margin-left:290px;background-color:white;width:450px;margin-top:40px;padding:10px;">There is no request present.</h2></caption></center> 
    
           <%
               }
           %>
            </table>
        </center>
       </div>
</div>
        </div>
       
        </div>
          
</body>
</html>