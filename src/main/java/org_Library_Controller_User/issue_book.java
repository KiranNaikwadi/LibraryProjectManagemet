package org_Library_Controller_User;

import java.util.*;


import java.io.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org_Library_Model_User.issueBookModel;
import org_Library_Service.BookService;
import org_Library_Service.BookServiceImpl;
import org_Library_Service_User.IssueBookService;
import org_Library_Service_User.IssueBookServiceImpl;


@WebServlet("/issue_book")
public class issue_book extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		boolean b;
		int st_id=Integer.parseInt(request.getParameter("st_id"));
		out.println("student id"+st_id);
		int b_id=Integer.parseInt(request.getParameter("b_id"));
	    out.println("book id"+b_id);
//		String status="borrowed";
		issueBookModel issModel=new issueBookModel();
		issModel.setB_id(b_id);
		issModel.setSt_id(st_id);
//		issModel.setStatus(status);
		BookService bService=new BookServiceImpl();
		b=bService.decreaseAvailableCopies(b_id);
		if(b)
		{
			IssueBookService issService=new IssueBookServiceImpl();
		    b=issService.issue_book(issModel);
			if(b)
			{
			  out.println("<h1>book issued successfully</h1>");
			}
			else
			{
				out.println("<h1>book not issued<h1>");
			}
		}
		else
		{
			out.println("<h1>book not available<h1>");
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doGet(request, response);
	}

}
