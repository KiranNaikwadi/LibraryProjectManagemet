package org_Library_Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org_Library_Service.BookService;
import org_Library_Service.BookServiceImpl;


@WebServlet("/deleteBook")
public class deleteBook extends HttpServlet {
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int bookid=Integer.parseInt(request.getParameter("bookid"));
		BookService bookservice=new BookServiceImpl();
		boolean b=bookservice.isDeleteBook(bookid);
		if(b) {
			RequestDispatcher r= request.getRequestDispatcher("viewBooks.jsp");
			 r.forward(request, response);
		}
		else {
			out.println("<h1>Sorry! book not deleted.</h1>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
