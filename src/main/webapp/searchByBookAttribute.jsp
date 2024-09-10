<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="org_Library_Service_User.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search book attribute</title>
<style>
 table
 {
  margin-top:30px;
 }
</style>
</head>
<body>
      <%! BookServiceUser stService=new BookServiceUserImpl(); %>   
            <table>
            <tr>
              <th>Sr.No</th>
              <th>Book Name</th>
              <th>Book Language</th>
              <th>Book Author</th>
              <th>Available Copies</th>
              <th>Category Name</th>
            </tr>
            <%
            String str=request.getParameter("n");
            
            List<Object[]> list1=stService.searchByBookAttribute(str);
            if(list1!=null)
            {
              int count=0;
              for(Object obj[]:list1)
               {
            %>
            <tr>
              <td><%=++count%></td>
              <td><%=obj[1]%></td>
              <td><%=obj[2]%></td>
              <td><%=obj[3]%></td>
              <td><%=obj[4]%></td>
              <td><%=obj[6]%></td>
            </tr>
            <%
            }
            }
            else
            {           	
       %>
          <!-- <tr>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td>
              
              <td>Not Available</td>
            </tr> -->
            <center><caption><h2 style="color:navy;margin-left:280px;background-color:white;width:500px;margin-top:40px;padding:10px;">There is no such book present...</h2></caption></center> 
    
       <%
        } 
       %>
          </table>
          
     
          
</body>
</html>
