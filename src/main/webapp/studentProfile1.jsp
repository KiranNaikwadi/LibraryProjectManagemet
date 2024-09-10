<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Controller.*,org_Library_Service.*,org_Library_Model.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View My Profile</title>

<link rel="stylesheet" href="CSS/viewStudent.css">
</head>
<body>
  <%@ include file="studentDashboard.jsp" %>
    <div class="col py-3">
       <center>
      <div class="whole_table">
      <h1>Student Details</h1><br></br>
      <div class="side-content">
        <table>
         <tr>
          <th>Id</th>
          <th>Name</th>
          <th>Contact</th>
          <th>Email</th>
          <th>Year</th>
           <th>Update</th>
          </tr>
          <%
          
           int id=Integer.parseInt(session.getAttribute("user_id").toString()); 
          StudentModel stModel=new StudentModel();
          stModel.setStudentid(id);
          StudentService stService=new StudentServiceImpl();
          List<StudentModel> list=stService.viewStudentProfile(stModel);
                  for(StudentModel obj:list)
                  {
          %>
          <tr>  
              <td><%=id%></td>
              <td><%=obj.getStudentname() %></td>
              <td><%=obj.getContact()%></td>
              <td id="one"><%=obj.getEmail() %></td>
              <td><%=obj.getYear()%></td>
               <td><a href='updateStudentProfile.jsp?st_id=<%=id%>'><img src="IMAGES/pen.png"style="width:20px;height:20px;"></a></td>
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
