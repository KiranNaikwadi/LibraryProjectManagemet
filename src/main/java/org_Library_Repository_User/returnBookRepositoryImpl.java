package org_Library_Repository_User;

import java.util.ArrayList;
import java.util.List;

import org_Library_Config.DBConfig;

public class returnBookRepositoryImpl extends DBConfig implements returnBookRepository{
	List<Object[]> list;
	  int value;
	@Override
	public List<Object[]> getIssueBooksById(int s_id) {
		try
		 {
			 list=new ArrayList<Object[]>();
			 stmt=conn.prepareStatement("select i.iss_id,b.b_name,b.b_language,b.b_id,c.cat_name from issue_book i inner join books b on i.b_id=b.b_id inner join category c on c.cat_id=b.cat_id where st_id=? and status='borrowed'");
			 stmt.setInt(1, s_id);
			 rs=stmt.executeQuery();
			 while(rs.next())
			 {
				 Object obj[]=new Object[] {rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5)};
				 list.add(obj);
			 }
			 return list.size()>0?list:null;
		 }
		 catch(Exception ex)
		 {
			 System.out.println("Error is "+ex);
			 return null;
		 }

	}

	@Override
	public boolean returnBookByIssId(int st_id,int iss_id, int b_id,String paid_status) {

		try
		{
			stmt=conn.prepareStatement("update issue_book set status='returned',return_date=curdate(),fine_status=? where iss_id=? and b_id=?");
		
			stmt.setString(1, paid_status);
			stmt.setInt(2, iss_id);
			stmt.setInt(3, b_id);
			value=stmt.executeUpdate();
		    if(value>0)
		    {
		    	stmt=conn.prepareStatement("update student set state='returned',bookcount=bookcount-1 where st_id=?");
		    	stmt.setInt(1, st_id);
		    	
		    	value=stmt.executeUpdate();
		    	return value>0?true:false;
		    }
		    else
		    {
		    	return false;
		    }
		}
		catch(Exception ex)
		{
			System.out.println("Error is "+ex);
			return false;
		}


	}

	@Override
	public List<Object[]> checkStatus(int st_id) {
		try
		{
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement("select i.iss_id,i.st_id,i.b_id,b.b_name,b.b_language,i.issue_date,i.due_date,i.status,i.return_date,i.fine,i.fine_status from issue_book i inner join books b on i.b_id=b.b_id where st_id=?");
			stmt.setInt(1, st_id);
			rs=stmt.executeQuery();
			while(rs.next())
			{
				
				Object obj[]=new Object[] {rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getInt(10),rs.getString(11)};
				list.add(obj);
			}
			return list.size()>0?list:null;
			
		}
		catch(Exception ex)
		{
			System.out.println("Error is "+ex);
			return null;
		}

	  }

	@Override
	public List<Object[]> getToBeReturnBook(int st_id, int b_id, int iss_id) {

	    try {
	    	list=new ArrayList<Object[]>();
	    	stmt=conn.prepareStatement("update issue_book set fine=case when curdate()>due_date then datediff(curdate(),due_date)*10 else 0 end where iss_id=? and b_id=? and st_id=? ");
	    	stmt.setInt(1, iss_id);
	    	stmt.setInt(2, b_id);
	    	stmt.setInt(3, st_id);
	    	value=stmt.executeUpdate();
	    	if(value>0)
	    	{
	    		System.out.println("Hi");
	          
	 	      stmt=conn.prepareStatement("select s.st_id,b.b_id,i.iss_id,b.b_name,b.b_language,i.issue_date,i.due_date,i.fine,i.fine_status from issue_book i inner join books b on i.b_id=b.b_id inner join student s on i.st_id=s.st_id where i.iss_id=? and b.b_id=? and s.st_id=?");
	 	      stmt.setInt(1, iss_id);
	     	  stmt.setInt(2, b_id);
	     	  stmt.setInt(3, st_id);
	     	  rs=stmt.executeQuery();
	     	  while(rs.next())
	     	  {  
	     		  Object obj[]=new Object[] {rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9)};
	     		  list.add(obj);
	     	  }
	     	  return list.size()>0?list:null;
	    	} 
	    	else
	    	{
	    		return null;
	    	}
	    }
	    catch(Exception ex)
	    {
	    	System.out.println("Exception in showtoBeReturnBook is "+ex);
	    	return null;
	    }
		
	  }

	

}
