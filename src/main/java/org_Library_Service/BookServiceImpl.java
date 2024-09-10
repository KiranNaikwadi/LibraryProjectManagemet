package org_Library_Service;

import java.util.List;

import org_Library_Model.BookModel;
import org_Library_Repository.BookRepository;
import org_Library_Repository.BookRepositoryImpl;

public class BookServiceImpl implements BookService{
   BookRepository bookrepo=new BookRepositoryImpl();
	@Override
	public boolean isAddNewBook(BookModel bookmodel,int categoryid) {
		return bookrepo.isAddNewBook(bookmodel,categoryid);
	}
	@Override
	public boolean isDeleteBook(int bookid) {
		// TODO Auto-generated method stub
		return bookrepo.isDeleteBook(bookid);
	}
	@Override
	public List<Object[]> getAllBooks() {
		// TODO Auto-generated method stub
		return bookrepo.getAllBooks();
	}
	@Override
	public boolean isUpdateBookById(BookModel bookmodel) {
		// TODO Auto-generated method stub
		return bookrepo.isUpdateBookById(bookmodel);
	}
	@Override
	public boolean decreaseAvailableCopies(int b_id) {
		// TODO Auto-generated method stub
		return bookrepo.decreaseAvailableCopies(b_id);
	}
	@Override
	public boolean increaseAvailableCopies(int b_id) {
		// TODO Auto-generated method stub
		return bookrepo.increaseAvailableCopies(b_id);
	}
	@Override
	public List<BookModel> viewBookDetails(BookModel bookmodel) {
		// TODO Auto-generated method stub
		return bookrepo.viewBookDetails(bookmodel);
	}
	

}
