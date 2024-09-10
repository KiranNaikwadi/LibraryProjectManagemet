package org_Library_Repository;

import java.util.ArrayList;
import java.util.List;

import org_Library_Config.DBConfig;
import org_Library_Model.ShelfModel;
import org_Library_Model.StudentModel;

public class shelfRepositoryImpl extends DBConfig implements shelfRepository{
	List<ShelfModel> list;
     int value;
     private  int shelfId;
     public int getShelfId() {
    	
		try {
    		 stmt=conn.prepareStatement("select max(shelf_id) from shelf");
    		 rs=stmt.executeQuery();
    		 if(rs.next()) {
    			 shelfId=rs.getInt(1);
    		 }
    		  ++shelfId;
    		 }
    	 catch(Exception ex) {
    		 System.out.println("Error is "+ex);
    		 return 0;
    	 }
    	 return shelfId;
     }
	@Override
	public boolean isAddNewShelf(ShelfModel model) {
		
	 	int shelfid=this.getShelfId();
	 	
	 	if(shelfid!=0)
	 	{
	 		try {
				stmt=conn.prepareStatement("insert into shelf values(?,?)");
				stmt.setInt(1,shelfid);
				stmt.setString(2,model.getShelfName());
				value=stmt.executeUpdate();
				if(value>0) {
					return true;
				}
				else {
					return false;
				}
			}
			catch(Exception ex) {
				System.out.println("Exception is "+ex);
				return false;
			}
	 	}
	 	else
	 	{
	 		return false;
	 	}
		
		
	}
	public List<ShelfModel> getAllShelf(){
		try {
			List<ShelfModel> list=new ArrayList<ShelfModel>();
			stmt=conn.prepareStatement("select * from shelf");
			rs=stmt.executeQuery();
			while(rs.next()) {
				ShelfModel model=new ShelfModel();
				model.setShelfId(rs.getInt(1));
				model.setShelfName(rs.getString(2));
				list.add(model);
				
			}
		   return list.size()>0?list:null;	
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return null;
		}
		
	}
	@Override
	public boolean isDeleteShelfById(int shelfid) {
		try {
			stmt=conn.prepareStatement("delete from shelf where shelf_id=?");
			stmt.setInt(1, shelfid);
            int value=stmt.executeUpdate();
            return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return false;
		}
		
	}
	@Override
	public boolean isUpdateShelf(ShelfModel model) {
		try {
			stmt=conn.prepareStatement("update shelf set shelf_name=? where shelf_id=?");
			stmt.setInt(2,model.getShelfId());
			stmt.setString(1,model.getShelfName());
			int value=stmt.executeUpdate();
			return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return false;
		}
	}
	@Override
	public List<ShelfModel> getAllShelf(String str) {
		try {
			List<ShelfModel> list=new ArrayList<ShelfModel>();
			stmt=conn.prepareStatement("select * from shelf where shelf_name like '%"+str+"%' ");
			rs=stmt.executeQuery();
			while(rs.next()) {
				ShelfModel model=new ShelfModel();
				model.setShelfId(rs.getInt(1));
				model.setShelfName(rs.getString(2));
				list.add(model);
				
			}
		   return list.size()>0?list:null;	
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return null;
		}
	}
	@Override
	public List<ShelfModel> viewUpdateShelfDetails(ShelfModel shelfmodel) {
		try {
			list=new ArrayList<ShelfModel>();
			stmt=conn.prepareStatement("select * from shelf where shelf_id=?");
			stmt.setInt(1,shelfmodel.getShelfId());
			rs=stmt.executeQuery();
			while(rs.next()) {
				ShelfModel shelfmodel1=new ShelfModel();
				shelfmodel1.setShelfName(rs.getString(2));
			list.add(shelfmodel1);
			}
			return list.size()>0?list:null;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
		
		return null;
	}
	}
	
}
