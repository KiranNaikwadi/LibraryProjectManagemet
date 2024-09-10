package org_Library_Controller_User;
import java.io.*;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org_Library_Service.BookService;
import org_Library_Service.BookServiceImpl;
import org_Library_Service_User.returnBookService;
//import org_Library_Service_User.*;
//import org_Library_Service_User.returnBookServiceImpl;
import org_Library_Service_User.returnBookServiceImpl;


@WebServlet("/returnBook")
public class returnBook extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		returnBookService rbService=new returnBookServiceImpl();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		boolean b;
		int st_id=Integer.parseInt(request.getParameter("st_id"));
		int iss_id=Integer.parseInt(request.getParameter("iss_id"));//right now we will not take the book id
		int b_id=Integer.parseInt(request.getParameter("b_id"));
		String paid_status=request.getParameter("paid_status");
		BookService bService=new BookServiceImpl();
		
		b=bService.increaseAvailableCopies(b_id);
		if(b)
		{
		    
			b=rbService.returnBookByIssId(st_id,iss_id,b_id,paid_status);
			if(b)
			{
				out.println("<h1>book not returned successfully..<h1>");
			}
			else
			{
				out.println("<h1>book  returned succesfully<h1>");
			}
		}
		else
		{
			RequestDispatcher r=request.getRequestDispatcher("returnBook.jsp");//not increase available copies
			r.include(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}