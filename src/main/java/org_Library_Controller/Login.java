package org_Library_Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org_Library_Service.LoginService;
import org_Library_Service.LoginServiceImpl;


@WebServlet("/Login")
public class Login extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");	
		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		LoginService lService=new LoginServiceImpl();
		int id=lService.verifyAdmin(username, password);
		
		if(id>0)
		{   
			HttpSession session=request.getSession(true);
			session.setAttribute("admin_id", id);
//			RequestDispatcher r=request.getRequestDispatcher("adminDashboard.jsp");
//			r.forward(request, response);
			response.sendRedirect("AdminDashboard.jsp");
		}
		else
		{
			id=lService.verifyUser(username, password);
			if(id>0)
			{   
				HttpSession session=request.getSession(true);
				session.setAttribute("user_id", id);
//				RequestDispatcher r=request.getRequestDispatcher("studentDashboard.jsp");
//				r.forward(request, response);
				response.sendRedirect("studentDashboard.jsp");
			}
			else
			{
				RequestDispatcher r=request.getRequestDispatcher("home1.jsp");
				r.include(request, response);
				out.println("Invalid Username or password!!");
				out.println("please try again");
			}
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
