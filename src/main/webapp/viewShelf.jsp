<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org_Library_Service.*,java.util.*,org_Library_Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Shelf</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> 
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>-->
<link href="CSS/viewShelf1.css" rel="stylesheet">

<script type="text/javascript">
  function searchByBookAttribute(str)
  {
	  let xhttp=new XMLHttpRequest();
  	xhttp.onreadystatechange=function(){
  		 if(this.readyState==4 && this.status==200){
  			 document.getElementById("d").innerHTML=this.responseText;
  		 }
  	};
  	xhttp.open("GET","viewShelfByAjaxCalling.jsp?n="+str,true);
  	xhttp.send();
  }
</script>
</head>
<%@include file="AdminDashboard.jsp" %>

<body>
<%! 

shelfService shelfservice=new shelfServiceImpl();
%>
<div class="col py-3">
            <center>
            <h1>View Shelf</h1><br>
            <input type='search' name='search' value='' placeholder='Search here' style="width:30%; height:35px; outline:none;" onkeyup="searchByBookAttribute(this.value)"><br>
          <div id="d"><br>
        <div class="side-content" style="overflow-y:scroll;height:250px;">
    <table>
    <thead class="position-sticky" style="top:0;position:fixed;">
    
               <tr>
               <th>Sr.No</th>
               <th>Shelf Name</th>
               <th>Delete</th>
               <th>Update</th>
               </tr>
               </thead>
               <%
                 
                 List<ShelfModel> list=shelfservice.getAllShelf();
               if(list!=null){
               int count=0;
               
               for(ShelfModel m:list){
               %>
               <tr>
               <td><%=++count%></td>
               <td><%=m.getShelfName() %></td>
               <td><a href='deleteShelf?shelfid=<%=m.getShelfId()%>'><img src="IMAGES/delete.png"style="width:20px;height:20px;"></a></a></td>
               <td><a href='updateShelf.jsp?shelfid=<%=m.getShelfId()%>'><img src="IMAGES/pen.png"style="width:20px;height:20px;"></a></td>
               </tr>
               <%
               }
               }
               
               else{
               %>
                <center><caption><h2 style="color:navy;margin-left:290px;background-color:white;width:450px;margin-top:40px;padding:10px;">There is no shelf present.</h2></caption></center> 
    
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