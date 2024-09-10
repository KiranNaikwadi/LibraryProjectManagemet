package org_Library_Repository_User;

import java.util.ArrayList;
import java.util.List;

import org_Library_Config.DBConfig;
import org_Library_Model_User.issueBookModel;

public class IssueBookRepositroyImpl extends DBConfig implements IssueBookRepository{
	 private int iss_id;
	    int value;
	    List<Object[]> list;
	    public int getIssId()
		{
			try
			{
				stmt=conn.prepareStatement("select max(iss_id) from issue_book");
				rs=stmt.executeQuery();
				if(rs.next())
				{
					iss_id=rs.getInt(1);
				}
				++iss_id;
			}
			catch(Exception ex)
			{
				System.out.println("Exception is "+ex);
				return 0;
			}
			return iss_id;
		}

	@Override
	public boolean issue_book(issueBookModel issModel) {
		iss_id=this.getIssId();
		  if(iss_id>0)
		  {
			  try
				 {
					stmt=conn.prepareStatement("insert into issue_book (iss_id,st_id,b_id,issue_date,due_date,status) values (?,?,?,curdate(),date_add(curdate(),interval 10 day),'borrowed')");
				    stmt.setInt(1, iss_id);
				    stmt.setInt(2,issModel.getSt_id());
				    stmt.setInt(3, issModel.getB_id());
//				    stmt.setString(4, issModel.getStatus());
				    value=stmt.executeUpdate();
				    if(value>0)
				    {
				    	stmt=conn.prepareStatement("update storerequest set state='issued' where st_id=? and b_id=?");
				    	stmt.setInt(1, issModel.getSt_id());
				    	stmt.setInt(2, issModel.getB_id());
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
					 System.out.println("Exception is "+ex);
					 return false;
				 }
		  }
		  else
		  {
			  System.out.println("Error is there");
			  return false;
		  }


	}

	@Override
	public boolean checkSameBook(int st_id, int b_id) {
		try
		{
			stmt=conn.prepareStatement("select * from storerequest where st_id=? and b_id=? and (state='issued' or state='requested')");
			stmt.setInt(1, st_id);
			stmt.setInt(2, b_id);
			rs=stmt.executeQuery();
			while(rs.next())
			{
				value=rs.getInt(1);
			}
			return value>0?true:false;
		}
		catch(Exception ex)
		{
			System.out.println("error is "+ex);
			return false;
		}

	}
	public int checkAvailableCopiesBook(int b_id)
	{
		try
		{
			stmt=conn.prepareStatement("select available_copies from books where b_id=?");
			stmt.setInt(1, b_id);
			rs=stmt.executeQuery();
			if(rs.next())
			{
				value=rs.getInt(1);
			}
			return value;
		}
		catch(Exception ex)
		{
			System.out.println("Error is "+ex);
			return 0;
		}
	}


	@Override
	public boolean sendRequest(int st_id, int b_id) {
		try
		  {
			  stmt=conn.prepareStatement("insert into storerequest (st_id,b_id) values(?,?)");
			  stmt.setInt(1, st_id);
			  stmt.setInt(2, b_id);
			  value=stmt.executeUpdate();
			  if(value>0)
			  {
				  stmt=conn.prepareStatement("select bookcount from student where st_id=?");
				  stmt.setInt(1, st_id);
				  rs=stmt.executeQuery();
				  if(rs.next())
				  {
					  int b_count=rs.getInt(1);
						/* System.out.println(b_count); */
					  if(b_count<3)
					  {
						  stmt=conn.prepareStatement("update student set bookcount=bookcount+1 where st_id=?");
						  stmt.setInt(1, st_id);
						  value=stmt.executeUpdate();
						  if(value>0)
						  {
							  stmt=conn.prepareStatement("update storerequest set state='requested' where st_id=? and b_id=?");
							  stmt.setInt(1, st_id);
							  stmt.setInt(2, b_id);
							  value=stmt.executeUpdate();
							  return value>0?true:false;
						  }
						  else
						  {
							  return false;
						  }
					  }
					  else
					  {
						  stmt=conn.prepareStatement("delete from storerequest where st_id=? and b_id=? and state is null");
						  stmt.setInt(1, st_id);
						  stmt.setInt(2, b_id);
						  value=stmt.executeUpdate();
						  return false;  
					  }
				  }
				  else
				  {
					  return false;
				  }
			  }
			  else
			  {
				  return false;//book cunt>3
			  }
		  }
		  catch(Exception ex)
		  {
			  System.out.println("Error is "+ex);
			  return false;
		  }
	}
	
	

	@Override
	public List<Object[]> viewRequest() {
		try
		{
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement("select s.st_id,b.b_id,s.st_name,b.b_name,sr.state from storeRequest sr inner join student s on sr.st_id=s.st_id inner join books b on sr.b_id=b.b_id where sr.state='requested'");
		    rs=stmt.executeQuery();
		    while(rs.next())
		    {
		    	Object obj[]=new Object[] {rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5)};
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
	public List<Object[]> viewRequestSearch(String str) {
		try
		{
			list=new ArrayList<Object[]>();
			stmt=conn.prepareStatement("select s.st_id,b.b_id,s.st_name,b.b_name,sr.state from storeRequest sr inner join student s on sr.st_id=s.st_id inner join books b on sr.b_id=b.b_id where st_name like '%"+str+"%' or b_name like '%"+str+"%'");
		    rs=stmt.executeQuery();
		    while(rs.next())
		    {
		    	Object obj[]=new Object[] {rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5)};
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


	


}
