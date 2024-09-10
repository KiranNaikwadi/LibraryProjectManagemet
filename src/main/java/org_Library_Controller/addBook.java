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


@WebServlet("/addBook")
public class addBook extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
      PrintWriter out=response.getWriter();
      String bookname=request.getParameter("bookname");
      String booklanguage=request.getParameter("booklanguage");
      String authorname=request.getParameter("authorname");
      int totalcopies=Integer.parseInt(request.getParameter("totalcopies"));
      int avaliablecopies=totalcopies;
		/*
		 * out.println(bookname); out.println(booklanguage); out.println(authorname);
		 * out.println(totalcopies); out.println(avaliablecopies);
		 */
      
      BookModel bookmodel=new BookModel();
      bookmodel.setBookname(bookname);
      
      bookmodel.setBooklanguage(booklanguage);
      bookmodel.setAuthorname(authorname);
      bookmodel.setTotalcopies(totalcopies);
      bookmodel.setAvaliablecopies(avaliablecopies);
      int categoryid=Integer.parseInt(request.getParameter("categoryid"));
		/* out.println(categoryid); */
      BookService bookservice=new BookServiceImpl();
      boolean b=bookservice.isAddNewBook(bookmodel,categoryid);
      if(b) {
  		
  		request.setAttribute("msg", "Book Added Successfully..");		}
  	else{
  		request.setAttribute("msg", "Book Not Added..");
  	}
  	RequestDispatcher r=request.getRequestDispatcher("addBooks1.jsp");
  	 r.include(request, response);

  }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
