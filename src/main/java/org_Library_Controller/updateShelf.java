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


@WebServlet("/updateShelf")
public class updateShelf extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  response.setContentType("text/html");
	  PrintWriter out=response.getWriter();
	  String shelfname=request.getParameter("shelfname");
	  int shelfid=Integer.parseInt(request.getParameter("shelfid"));
	 ShelfModel model=new ShelfModel();
	 model.setShelfId(shelfid);
	 model.setShelfName(shelfname);
	 shelfRepository shelfrepo=new shelfRepositoryImpl();
	 shelfService shelfservice= new shelfServiceImpl();
	 boolean b=shelfservice.isUpdateShelf(model);
	 if(b) {
			
			request.setAttribute("msg", "Shelf Updated Successfully..");		}
		else{
			request.setAttribute("msg", "Shelf Not Updated..");
		}
		RequestDispatcher r=request.getRequestDispatcher("updateShelf.jsp");
		 r.include(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
