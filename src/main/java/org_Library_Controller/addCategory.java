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


@WebServlet("/addCategory")
public class addCategory extends HttpServlet {
	CategoryService catservice=new CategoryServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	PrintWriter out=response.getWriter();
	String categoryname=request.getParameter("categoryname");
	CategoryModel catmodel=new CategoryModel();
	catmodel.setCatname(categoryname);
	int shelfid =Integer.parseInt(request.getParameter("shelf_id"));
	boolean b=catservice.isAddCategory(catmodel,shelfid);
	if(b) {
		
		request.setAttribute("msg", "Category Added Successfully..");		}
	else{
		request.setAttribute("msg", "Category Not Added..");
	}
	RequestDispatcher r=request.getRequestDispatcher("addCategory.jsp");
	 r.include(request, response);

}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
