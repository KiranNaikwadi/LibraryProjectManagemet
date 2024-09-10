<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org_Library_Service_User.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>view student status by Admin</title>
<link rel="stylesheet" href="CSS/viewBooks.css">
</head>
<body>
  <%@ include file="AdminDashboard.jsp" %>
     <div class="col py-3">
       <center>
       
       
          <h1>Student Status</h1><br></br>
      <input type='search' name='search' value='' placeholder='Search here' style="width:30%; height:35px; outline:none;" onkeyup="searchByBookAttribute(this.value)"><br>
          <div id="d"><br>
          <div class="only-table" style="overflow-y:scroll;height:350px;">
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
             int st_id=Integer.parseInt(request.getParameter("st_id"));
             returnBookService rbService=new returnBookServiceImpl();
             List<Object[]> list=rbService.checkStatus(st_id);
             if(list!=null)
             {
            	 int count=0;
            	 for(Object obj[]:list)
            	 {
          %>
            <tr>
              <td style="background-color:white;"><%=++count %></td>
              <td style="background-color:white;"><%=obj[3] %></td>
              <td style="background-color:white;"><%=obj[4] %></td>
              <td style="background-color:white;"><%=obj[5] %></td> 
              <td style="background-color:white;"><%=obj[6] %></td> 
              <td style="background-color:white;"><%=obj[7] %></td> 
              <td style="background-color:white;"><%=obj[8] %></td> 
              <td style="background-color:white;"><%=obj[9] %></td>
                 <td style="background-color:white;"><%=obj[10] %></td>  
                        
            </tr>
         <%
    	 
            	 }
             }
             else
             {
         %>
        
            <center><caption><h2 style="color:navy;margin-left:280px;background-color:white;width:500px;margin-top:40px;padding:10px;">There is no book present ro return.</h2></caption></center> 
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