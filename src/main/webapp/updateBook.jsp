<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="org_Library_Model.*,org_Library_Service.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Book</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="CSS/updateBook.css">
</head>
<body onload="hidemessage()">
<%@include file="AdminDashboard.jsp" %>
<div class="col py-3">
<%! BookService bookservice=new BookServiceImpl(); %>
     <center>
            <div class="form-content">
               <h2>Update Book</h2><br>
              <form name='frm' action='updateBook' method='POST'>
              <table>
               <tr>
                 <td>
                  <label>Book Name:</label>
                 
                 </td>
                 <td>
                  <%int bid=Integer.parseInt(request.getParameter("bookid"));
                  if(bid>0){
                	  BookModel bookmodel=new BookModel();
                	  bookmodel.setBookid(bid);
                	  List<BookModel> list=bookservice.viewBookDetails(bookmodel);
                	  for(BookModel obj:list)
                	  {
                  %>
                  
                  <input type='text' name='bookname' value='<%=(String)obj.getBookname()%>' placeholder='Enter Book Name' required/></br></br>
                  <input type="hidden" name='bookid' value='<%=bid%>'/>
                 </td>
               </tr>
               <tr>
                 <td>
                   <label>Book Language:</label>
                 </td>
                 <td>
                   <input type='text' name='booklanguage' value='<%=(String)obj.getBooklanguage() %>' placeholder='Enter Book Language' required/></br></br>
                 </td>
                </tr>
                <tr>
                  <td>
                   <label>Author Name:</label>
                  </td>
                  <td>
                    <input type='text' name='authorname' value='<%=(String)obj.getAuthorname() %>' placeholder='Enter Author Name'/></br></br>
                  </td>
                </tr>
                <tr>
                 <td>
                   <label>Total Copies:</label>
                 </td>
                 <td>
                   <input type='number' name='totalcopies' value='<%=(int)obj.getTotalcopies()%>' placeholder='select' min="1" max="10"/></br></br>
                 </td>
                </tr>
                <tr>
                 <td>
                   <label id="one">Available Copies:</label>
                 </td>
                 <td>
                   <input type='number' name='avaliablecopies' class='one' value='<%=(int)obj.getAvaliablecopies() %>' placeholder='select' min="1" max="10"/></br></br>
                 </td>
                </tr>
                <%
                }
                  }
                %>
                 </table>
                 <button type="submit" name="s" class="btn btn-primary">Update Book</button>
                 <h5 id='automatic' style='text-align:center;margin-top:15px;'></h5><br>
              </form>
            </div>
        </center>
     </div>    
    </div>
   </div>
  </div>
  <%
    String msg=(String) request.getAttribute("msg");
    if(msg!=null)
    {
  %>
   <script>
    function hidemessage()
    {
    	var hideElement=document.getElementById("automatic");
    	var originalText=hideElement.innerHTML;
    	var typemessage="<%=msg%>";
    	if(typemessage)
    		{
    		  hideElement.innerHTML=typemessage;
     		  if (typemessage.includes("Book Updated Successfully")) {
   	            hideElement.style.color ="green"; // Green color for success message
    	        } else {
    	            hideElement.style.color = "red"; // Red color for failure message
     	        }
    		  setTimeout(function(){hideElement.innerHTML=originalText;},3000);
    		}
    }
   </script>
  <%
    }
  %>
  
</body>
</html>