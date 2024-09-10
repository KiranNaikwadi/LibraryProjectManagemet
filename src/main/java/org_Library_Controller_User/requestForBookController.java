package org_Library_Controller_User;
import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org_Library_Service_User.*;
@WebServlet("/requestForBook")
public class requestForBookController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		IssueBookService issService=new IssueBookServiceImpl();
		boolean value;
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int st_id=Integer.parseInt(request.getParameter("st_id"));
		out.println(st_id);
		int b_id=Integer.parseInt(request.getParameter("b_id"));
		out.println(b_id);
		
		  value=issService.checkSameBook(st_id, b_id); 
		  out.println(value);
		  if(value) {
		  out.println("<h1>you cannot issue same book twice<h1>"); 
		  } 
		  else
			 {
				int value1=issService.checkAvailableCopiesBook(b_id);
				if(value1>0)
				{
					value=issService.sendRequest(st_id, b_id);
					if(value)
					{
						out.println("<h1>requested<h1>");
					}
					else
					{
						out.println("<h1>you have exceeded the count<h1>");
					}
				}
				else
				{
					out.println("<h1>Book not available<h1>");
				}		
			  }
		 
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
