package org_Library_Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org_Library_Model.BookModel;
import org_Library_Service.BookService;
import org_Library_Service.BookServiceImpl;


@WebServlet("/updateBook")
public class updateBook extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String bookname=request.getParameter("bookname");
		int bookid=Integer.parseInt(request.getParameter("bookid"));
		String booklanguage=request.getParameter("booklanguage");
		String bookauthor=request.getParameter("bookauthor");
		int totalcopies=Integer.parseInt(request.getParameter("totalcopies"));
		int avaliablecopies=Integer.parseInt(request.getParameter("avaliablecopies"));
		BookModel bookmodel=new BookModel();
		bookmodel.setBookname(bookname);
		bookmodel.setBookid(bookid);
		bookmodel.setBooklanguage(booklanguage);
		bookmodel.setTotalcopies(totalcopies);
		bookmodel.setAvaliablecopies(avaliablecopies);
		BookService bookservice=new BookServiceImpl();
		boolean b=bookservice.isUpdateBookById(bookmodel);
      if(b) {
			
			request.setAttribute("msg", "Book Updated Successfully..");		}
		else{
			request.setAttribute("msg", "Book Not Updated..");
		}
		RequestDispatcher r=request.getRequestDispatcher("updateBook.jsp");
		 r.include(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
