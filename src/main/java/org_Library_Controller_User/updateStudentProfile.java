package org_Library_Controller_User;

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


@WebServlet("/updateStudentProfile")
public class updateStudentProfile extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int st_id = Integer.parseInt(request.getParameter("st_id"));
        String st_name = request.getParameter("st_name");
	    String st_contact = request.getParameter("st_contact");
	    String st_email = request.getParameter("st_email");
	    String st_year = request.getParameter("st_year");
		StudentModel stModel=new StudentModel();
		stModel.setStudentid(st_id);
		stModel.setStudentname(st_name);
		stModel.setContact(st_contact);
		stModel.setEmail(st_email);
		stModel.setYear(st_year);
		
		StudentService stService=new StudentServiceImpl();
		boolean b=stService.isUpdateStudent(stModel);
		if(b)
		{
			request.setAttribute("msg", "Updated Successfully..");
		}
		else
		{
			request.setAttribute("msg", "Not Updated..");
		}
		RequestDispatcher r=request.getRequestDispatcher("updateStudentProfile.jsp");
		r.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}


}
