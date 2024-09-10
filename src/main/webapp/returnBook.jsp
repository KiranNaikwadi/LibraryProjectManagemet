<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="org_Library_Service_User.*,java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>return book</title>
<link rel="stylesheet" href="CSS/viewBooks.css">
</head>
<body>
  <%@ include file="AdminDashboard.jsp" %>
     <div class="col py-3">
        <center>
       
         
          <h1>Issued Books</h1><br></br>
         
    <div class="only-table" style="overflow-y:scroll;height:350px;">
          <table>
          <thead class="position-sticky" style="top:0;">
            <tr>
              <th>Sr.No</th>
              <th>Book Name</th>
              <th>Book Language</th>
              <th>Category Name</th>
              <th>Return Book</th>
            </tr>
           </thead>
            <%
            int st_id=Integer.parseInt(request.getParameter("st_id")); 
            returnBookService rbService=new returnBookServiceImpl();
            List<Object[]> list=rbService.getIssueBooksById(st_id);
            if(list!=null)
            { 
         	   int count=0;
         	   for(Object obj[]:list)
         	   {	
            %>
            <tr>
            <td><%=++count%></td>
            <td><%=obj[1]%></td>
            <td><%=obj[2]%></td>
            <td><%=obj[4]%></td>
            <td><a href="ShowtobeReturnBook.jsp?iss_id=<%=obj[0]%>&b_id=<%=obj[3]%>&st_id=<%=st_id%>"><button type="submit" class="btn btn-primary mb-2" style="padding:5px;background-color:green;border:none;">Return Book</button></a></td>
            </tr>
           <%
    	   }
       }
       else
       {
           %>
           <tr>
              <td style="background-color:white;">NA</td>
              <td style="background-color:white;">Not Available</td>
              <td style="background-color:white;">Not Available</td>
              <td style="background-color:white;">Not Available</td>
              <td style="background-color:white;">Not Available</td>
            </tr>
         <%
       }
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
