package org_Library_Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org_Library_Model.StudentModel;
import org_Library_Service.StudentService;
import org_Library_Service.StudentServiceImpl;


@WebServlet("/updateStudent")
public class updateStudent extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	
	String studentname=request.getParameter("studentname");
	String contact=request.getParameter("contact");
	String email=request.getParameter("email");
	String year=request.getParameter("year");
	int studentid=Integer.parseInt(request.getParameter("studentid"));
	StudentModel studmodel=new StudentModel();
	
	studmodel.setStudentname(studentname);
	studmodel.setContact(contact);
	studmodel.setEmail(email);
	studmodel.setYear(year);
	studmodel.setStudentid(studentid);
	StudentService studservice=new StudentServiceImpl();
	boolean b=studservice.isUpdateStudent(studmodel);
	if(b) {
		
		request.setAttribute("msg", "Student Updated Successfully..");		}
	else{
		request.setAttribute("msg", "Student Not Updated..");
	}
	RequestDispatcher r=request.getRequestDispatcher("updateStudent.jsp");
	 r.include(request, response);
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
