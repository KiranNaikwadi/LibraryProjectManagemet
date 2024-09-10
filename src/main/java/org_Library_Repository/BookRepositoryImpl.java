package org_Library_Repository;

import java.util.ArrayList;
import java.util.List;

import org_Library_Config.DBConfig;
import org_Library_Model.BookModel;
import org_Library_Model.StudentModel;

public class BookRepositoryImpl extends DBConfig implements BookRepository {
  private int value;
  private int bookid;
  List<Object[]> list;
  List<BookModel> list1;
  public int getMaxBookId() {
	  try {
		 stmt=conn.prepareStatement("select max(b_id) from books");
		rs=stmt.executeQuery();
		if(rs.next()) {
			 bookid=rs.getInt(1);
			
		}
		++bookid;
	  }
	  catch(Exception ex) {
		  System.out.println("Error is "+ex);
		 return 0;
	  }
	  return bookid;
  }
	public boolean isAddNewBook(BookModel bookmodel,int categoryid) {
		int bookid=this.getMaxBookId();
		if(bookid>0) {
		try {
			stmt=conn.prepareStatement("insert into books values(?,?,?,?,?,?,?)");
			stmt.setInt(1,bookid);
			stmt.setString(2,bookmodel.getBookname());
			stmt.setString(3,bookmodel.getBooklanguage() );
			stmt.setString(4,bookmodel.getAuthorname());
			stmt.setInt(5,bookmodel.getTotalcopies());
			stmt.setInt(6,bookmodel.getAvaliablecopies());
			stmt.setInt(7,categoryid);
		 value=stmt.executeUpdate();
		 if(value>0) {
			 return true;
		 }
		 else {
			 return false;
		 }
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
		return false;
		}
		}
		else {
			return false;
		}
	}
	@Override
	public List<Object[]> getAllBooks() {
		try {
			list=new ArrayList<Object[]>(); 
			stmt=conn.prepareStatement("select b.b_id,b.b_name,b.b_language,b.b_author,b.total_copies,b.available_copies,b.cat_id,c.cat_name from books b inner join category c on b.cat_id=c.cat_id");
			rs=stmt.executeQuery();
			while(rs.next()) {
				Object []obj=new Object[] {
						rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getString(8)
				};
				list.add(obj);
           }
			
			return list.size()>0?list:null;
		}
		
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return null;
		}
		
	}
	
	
	public boolean isDeleteBook(int bookid) {
		try {
			stmt=conn.prepareStatement("delete from books where b_id=?");
			stmt.setInt(1, bookid);
			int value=stmt.executeUpdate();
			return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return false;
		}
		
	}
	@Override
	public boolean isUpdateBookById(BookModel bookmodel) {
		try {
			stmt=conn.prepareStatement("update books set b_name=?,b_language=?,total_copies=?,available_copies=? where b_id=?");
			stmt.setString(1,bookmodel.getBookname());
			stmt.setString(2,bookmodel.getBooklanguage());
			stmt.setInt(3,bookmodel.getTotalcopies());
			stmt.setInt(4, bookmodel.getAvaliablecopies());
			stmt.setInt(5, bookmodel.getBookid());
			int value=stmt.executeUpdate();
			return value>0?true:false;
					
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return false;
		}
		
	}
	@Override
	public List<Object[]> getCategoryWiseBooks() {
		try {
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement(" select b.b_id,b_name,b_language,b_author,b.total_copies,b.available_copies,c.cat_name from books b inner join category c on b.cat_id=c.cat_id where b.cat_id=?");
			rs=stmt.executeQuery();
					
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return null;
		}
		return null;
	}
	public boolean decreaseAvailableCopies(int b_id)
	{
		try
		{
			stmt=conn.prepareStatement("update books set available_copies=available_copies-1 where b_id=?");
		    stmt.setInt(1, b_id);
		    value=stmt.executeUpdate();
		    return value>0?true:false;
		}
		catch(Exception ex)
		{
			System.out.println("Exception is "+ex);
			return false;
		}
	}
	
	public boolean increaseAvailableCopies(int b_id)
	{
	  try
	  {
		stmt=conn.prepareStatement("update books set available_copies=available_copies+1 where b_id=?");
		stmt.setInt(1, b_id);
		value=stmt.executeUpdate();
		return value>0?true:false;
	  }
	  catch(Exception ex)
	  {
		  System.out.println("Error is "+ex);
		  return false;
	  }
		
	}
	@Override
	public List<BookModel> viewBookDetails(BookModel bookmodel) {
		try {
		list1=new ArrayList<BookModel>();
		stmt=conn.prepareStatement("select * from books where b_id=?");
		stmt.setInt(1,bookmodel.getBookid());
		rs=stmt.executeQuery();
		while(rs.next()) {
			BookModel bookmodel1=new BookModel();
			bookmodel1.setBookname(rs.getString(2));
			bookmodel1.setBooklanguage(rs.getString(3));
			bookmodel1.setAuthorname(rs.getString(4));
			bookmodel1.setTotalcopies(rs.getInt(5));
			bookmodel1.setAvaliablecopies(rs.getInt(6));
			list1.add(bookmodel1);
		}
		return list1.size()>0?list1:null;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
		
		return null;
		}
	}

	 

}
