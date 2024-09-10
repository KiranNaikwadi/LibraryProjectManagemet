<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service.*,java.util.*,org_Library_Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student Details Search</title>
<style>
   table
 {
  margin-top:30px;
 }
</style>
</head>
<body>
 
 <div class="col py-3">
  <table>
          
          
            <tr>
              <th>Sr.No</th>
              <th>Student Name</th>
              <th>Student Contact</th>
              <th>Student Email</th>
              <th>Student Year</th>
              <th>Return Book</th>
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
              <td><a href="returnBook.jsp?st_id=<%=(int)obj.getStudentid()%>"><button type="submit" class="btn btn-primary mb-2" style="padding:5px;background-color:green;border:none;">Return Book</button></a></td>
            </tr>
            <%
            }
            }
            else
            {           	
       %>
          <tr>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td>
             
            </tr>
       <%
        } 
       %>
          </table>
       </div>
       </div>
   </div>
  </div>   
</body>
</html>
