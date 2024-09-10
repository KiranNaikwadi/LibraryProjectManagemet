package org_Library_Repository_User;

import java.util.ArrayList;
import java.util.List;

import org_Library_Config.DBConfig;

public class BookRepositoryUserImpl extends DBConfig implements BookRepositoryUser{
	List<Object[]> list1;
    int value;
    public List<Object[]> searchByBookAttribute(String str) 
	{
	  try
	  {
		  list1=new ArrayList<Object[]>();
		  stmt=conn.prepareStatement("select b.b_id,b.b_name,b.b_language,b.b_author,b.available_copies,b.cat_id,c.cat_name from books b inner join category c on b.cat_id=c.cat_id where b.b_name like '%"+str+"%' or b.b_language like '%"+str+"%' or b.b_author like '%"+str+"%' or c.cat_name like '%"+str+"%'");
		  rs=stmt.executeQuery();
		  while(rs.next())
		  {
			  Object obj[]=new Object[] {rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getInt(6),rs.getString(7)};
			  list1.add(obj);
		  }
		  return list1.size()>0?list1:null;
	  }
	  catch(Exception ex)
	  {
		  System.out.println("Error is "+ex);
		  return null;
	  }
	}

}
