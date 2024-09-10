package org_Library_Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org_Library_Service.StudentService;
import org_Library_Service.StudentServiceImpl;


@WebServlet("/deleteStudent")
public class deleteStudent extends HttpServlet {
	
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html");
	  PrintWriter out=response.getWriter();
	  int studentid=Integer.parseInt(request.getParameter("studentid"));
	  StudentService studservice=new StudentServiceImpl();
	  boolean b=studservice.isDeleteStudentById(studentid);
	  if(b){
		   RequestDispatcher r=request.getRequestDispatcher("viewStudent.jsp");
		   r.forward(request, response);
		   
	   }
	   else {
		   
		   out.println("<h1>Sorry! student not deleted...</h1>");
	   }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
