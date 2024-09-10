package org_Library_Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org_Library_Model.CategoryModel;
import org_Library_Service.CategoryService;
import org_Library_Service.CategoryServiceImpl;

@WebServlet("/updateCategory")
public class updateCategory extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html");
	  PrintWriter out=response.getWriter();
	  String categoryname=request.getParameter("categoryname");
	  int categoryid=Integer.parseInt(request.getParameter("categoryid"));
	  
	  CategoryModel catmodel=new CategoryModel();
	  catmodel.setCatid(categoryid);
	  catmodel.setCatname(categoryname);
	  CategoryService categoryservice=new CategoryServiceImpl();
	  boolean b=categoryservice.isUpdateCategory(catmodel);
	  if(b) {
			
			request.setAttribute("msg", "Category Updated Successfully..");		}
		else{
			request.setAttribute("msg", "Category Not Updated..");
		}
		RequestDispatcher r=request.getRequestDispatcher("updateCategory.jsp");
		 r.include(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
