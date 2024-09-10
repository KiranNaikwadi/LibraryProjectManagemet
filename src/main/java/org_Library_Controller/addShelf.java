package org_Library_Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org_Library_Model.ShelfModel;
import org_Library_Repository.shelfRepository;
import org_Library_Repository.shelfRepositoryImpl;
import org_Library_Service.shelfService;
import org_Library_Service.shelfServiceImpl;


@WebServlet("/newShelf")
public class addShelf extends HttpServlet {
	shelfService shelfservice=new shelfServiceImpl();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String shelfName=request.getParameter("shelfName");
		ShelfModel model=new ShelfModel();
		model.setShelfName(shelfName);
		shelfRepository shelfrepo=new shelfRepositoryImpl();
		boolean b=shelfservice.isAddNewShelf(model);
		if(b) {
			
			request.setAttribute("msg", "Shelf Added Successfully..");		}
		else{
			request.setAttribute("msg", "Shelf Not Added..");
		}
		RequestDispatcher r=request.getRequestDispatcher("addShelf.jsp");
		 r.include(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
