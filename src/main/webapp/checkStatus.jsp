<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service_User.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>check status</title>
<link rel="stylesheet" href="CSS/viewBooks.css">
</head>
<body>
  <%@ include file="studentDashboard.jsp" %>
     <div class="col py-3">
       <center>
       
        
          <h1>Check Status</h1>
       <br><br>
          <div class="only-table" style="overflow-y:scroll;height:250px;">
          <table>
          <thead class="position-sticky" style="top:0;">
            <tr>
              <th>Sr.No</th>
              <th>Book Name</th>
              <th>Book Language</th>
              <th>Issue Date</th>
              <th>Due Date</th>
              <th>Status</th>
              <th>Return Date</th>
              <th>Fine</th>
              <th>Fine Status</th>
              
            </tr>
            </thead>
          <%
             int st_id=(int)session.getAttribute("user_id");
             returnBookService rbService=new returnBookServiceImpl();
             List<Object[]> list=rbService.checkStatus(st_id);
             if(list!=null)
             {
            	 int count=0;
            	 for(Object obj[]:list)
            	 {
          %>
            <tr>
              <td><%=++count %></td>
              <td><%=obj[3] %></td>
              <td ><%=obj[4] %></td>
              <td><%=obj[5] %></td> 
              <td><%=obj[6] %></td> 
              <td><%=obj[7] %></td> 
              <td><%=obj[8] %></td> 
              <td><%=obj[9] %></td> 
              <td><%=obj[10] %></td>           
            </tr>
         <%
    	 
            	 }
             }
             else
             {
         %>
         <tr>
              <td >NA</td>
              <td>Not Available</td>
              <td>Not Available</td>
              <td>Not Available</td> 
              <td>Not Available</td> 
              <td>Not Available</td> 
              <td>Not Available</td> 
              <td >Not Available</td> 
              <td >Not Available</td>          
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