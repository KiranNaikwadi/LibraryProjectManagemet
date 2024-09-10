<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service_User.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view request search</title>
<style>
   table
 {
  margin-top:30px;
 }
</style>
</head>
<body>
  <table>
          
            <thead >
            <tr>
               <th>Sr.No</th>
              <th>Student Name</th>
              <th>Book Name</th>
              <th>status</th>
              <th>Accept</th>
            </tr>
            </thead>
            <%
            String str=request.getParameter("n");
           IssueBookService issService= new IssueBookServiceImpl();
            List<Object[]> list1=issService.viewRequestSearch(str);
            if(list1!=null)
            {
              int count=0;
              for(Object obj[]:list1)
               {
            %>
            <tr>
              <td><%=++count%></td>
              <td><%=obj[2]%></td>
              <td><%=obj[3]%></td>
              <td><%=obj[4]%></td>
              <td><a href="issue_book?st_id=<%=(int)obj[0]%>&b_id=<%=(int)obj[1]%>"><button type="submit" class="btn btn-primary mb-2" style="padding:5px;background-color:green;border:none;">Accept</button></a></td>
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
          
</body>
</html>
