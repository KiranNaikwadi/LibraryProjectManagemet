<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="org_Library_Model.*,org_Library_Service_User.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/addStudent.css">
<title>show to be returned book</title>
</head>
<body >
 <%@ include file="AdminDashboard.jsp" %>
    <div class="col py-3">
      <center>
            <div class="form-content">
             <h2>Details</h2><br>
              <form name='frm' action='returnBook' method='POST'>
            <%int st_id=Integer.parseInt(request.getParameter("st_id"));
              int b_id=Integer.parseInt(request.getParameter("b_id"));
              int iss_id=Integer.parseInt(request.getParameter("iss_id"));%>
                 <input type='hidden' name='st_id' value='<%=st_id%>'>
                 <input type='hidden' name='b_id' value='<%=b_id%>'>
                 <input type='hidden' name='iss_id' value='<%=iss_id%>'>
            <%
               returnBookService rbService=new returnBookServiceImpl();
               List<Object[]> list=rbService.getToBeReturnBook(st_id, b_id, iss_id);
               for(Object obj[]:list)
               {
                       %>
              <table>
               <tr>
                 <td>
                  <label>Book Name</label>
                 </td>
                 <td>
                  <input type='text' name='st_name' class='' value='<%=obj[3]%>' disabled/></br></br>
                 </td>
               </tr>
               <tr>
                 <td>
                   <label id='one'>Language </label>
                 </td>
                 <td>
                   <input type='text' name='st_contact' class='' value='<%=obj[4] %>'  placeholder='Enter Contact' disabled/></br></br>
                 </td>
                </tr>
                <tr>
                  <td>
                   <label>Issue Date</label>
                  </td>
                  <td>
                    <input type='email' name='st_email' value='<%=obj[5]%>' disabled/></br></br>
                  </td>
                </tr>
                <tr>
                 <td>
                   <label>Due Date</label>
                 </td>
                 <td>
                   <input type='text' name='st_year' class='' value='<%=obj[6]%>' disabled /></br></br>
                 </td>
                 
                </tr>
                <tr>
                 <td>
                   <label>Fine</label>
                 </td>
                 <td>
                   <input type='text' name='st_year' class='' value='<%=obj[7] %>' disabled /></br></br>
                 </td>
                </tr>
                <tr>
                 <td>
                   <label style="margin-right:20px;">Paid Status</label>
                 </td>
                 <td>
                  <input type='radio' name='paid_status' value='paid' style="margin-bottom:35px;" required>paid
                  <input type='radio' name='paid_status' value='unpaid' style="margin-bottom:35px;margin-left:10px;" required>unpaid
                 </td>
                </tr>
                 </table>
                 <button type="submit" name="s" class="btn btn-primary">Update</button><br>
                 <h5 id='automatic' style='text-align:center;margin-top:15px;'></h5>
              </form>
              <%   
               }
             %>
            </div>
        </center>
    </div>
   </div>
  </div>
 </div>
</body>
</html>
