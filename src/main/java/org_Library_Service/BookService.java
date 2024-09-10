package org_Library_Service;

import java.util.List;

import org_Library_Model.BookModel;

public interface BookService {
	public boolean isAddNewBook(BookModel bookmodel,int categoryid);
	public List<Object[]> getAllBooks();
	public boolean isDeleteBook(int bookid) ;
	public boolean isUpdateBookById(BookModel bookmodel);
	 public boolean decreaseAvailableCopies(int b_id);
	  public boolean increaseAvailableCopies(int b_id);
	  public List<BookModel> viewBookDetails(BookModel bookmodel);
}
