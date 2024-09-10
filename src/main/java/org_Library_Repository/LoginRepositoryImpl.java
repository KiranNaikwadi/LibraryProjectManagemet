package org_Library_Repository;

import org_Library_Config.DBConfig;

public class LoginRepositoryImpl extends DBConfig implements LoginRepository{

	@Override
	public int verifyAdmin(String username, String password) {
		try
		{
			stmt=conn.prepareStatement("select * from admin where username=? and password=?");
			stmt.setString(1, username);
		    stmt.setString(2, password);
		    rs=stmt.executeQuery();
		    if(rs.next())
		    {
		    	
		    	
		    	return rs.getInt(3);
		    }
		    return 0;
		}
		catch(Exception ex)
		{
			System.out.println("Exception is "+ex);
			return 0;
		}
	}


	

	@Override
	public int verifyUser(String username, String password) {
		try
		{
			stmt=conn.prepareStatement("select * from student where st_email=? and st_contact=?");
			stmt.setString(1, username);
		    stmt.setString(2, password);
		    rs=stmt.executeQuery();
		    if(rs.next())
		    {
		    	return rs.getInt(1);
		    }
		    return 0;
		}
		catch(Exception ex)
		{
			System.out.println("Exception is "+ex);
			return 0;
		}
	

	}

}
