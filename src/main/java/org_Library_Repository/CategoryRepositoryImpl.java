package org_Library_Repository;

import java.util.ArrayList;
import java.util.List;

import org_Library_Config.DBConfig;
import org_Library_Model.CategoryModel;
import org_Library_Model.StudentModel;

public class CategoryRepositoryImpl extends DBConfig implements CategoryRepository{
   private int value;
   private int CategoryId;
   List<Object[]> list;
   List<CategoryModel> list1;
   public int getCategoryId() {
	   try {
		   stmt=conn.prepareStatement("select max(cat_id) from category");
		   rs=stmt.executeQuery();
		   if(rs.next()) {
			   CategoryId=rs.getInt(1);
			   
		   }
		   ++CategoryId;
	   }
	   catch(Exception ex) {
		   System.out.println("Error is "+ex);
		   return 0;
	   }
	   return CategoryId;
   }
	@Override
	public boolean isAddCategory(CategoryModel catmodel,int shelfid) {
		int categoryid=this.getCategoryId();
		if(categoryid!=0) {
		try {
			
			stmt=conn.prepareStatement("insert into category values(?,?,?)");
			stmt.setInt(1,categoryid);
			stmt.setString(2,catmodel.getCatname());
			stmt.setInt(3, shelfid);
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
	public  List<Object[]> getAllCategory() {
		try {
		   list = new ArrayList<Object[]>();
			stmt=conn.prepareStatement("select cat_id,cat_name,shelf_name from category c inner join shelf s on c.shelf_id=s.shelf_id");
			rs=stmt.executeQuery();
			while(rs.next()) {
				Object []obj=new Object[] {
				rs.getInt(1),rs.getString(2),rs.getString(3)		
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
	@Override
	public boolean isDeleteCategoryById(int categoryid) {
		try {
		stmt=conn.prepareStatement("delete from category where cat_id=?");
		stmt.setInt(1,categoryid);
		int value=stmt.executeUpdate();
		return value>0?true:false;
		
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
		return false;
		}
	}
	@Override
	public boolean isUpdateCategory(CategoryModel catmodel) {
		try {
			stmt=conn.prepareStatement("update category set cat_name=? where cat_id=?");
			stmt.setString(1,catmodel.getCatname());
			stmt.setInt(2,catmodel.getCatid());
			int value=stmt.executeUpdate();
			return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return false;
		}
		
	}
	@Override
	public List<Object[]> getAllCategory(String str) {
		try {
			   list = new ArrayList<Object[]>();
				stmt=conn.prepareStatement("select cat_id,cat_name,shelf_name from category c inner join shelf s on c.shelf_id=s.shelf_id where cat_name like '%"+str+"%' or shelf_name like '%"+str+"%'");
				rs=stmt.executeQuery();
				while(rs.next()) {
					Object []obj=new Object[] {
					rs.getInt(1),rs.getString(2),rs.getString(3)		
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
	@Override
	public List<CategoryModel> viewCategoryDetails(CategoryModel catmodel) {
		try {
		  list1=new ArrayList<CategoryModel>();
		  stmt=conn.prepareStatement("select * from category where cat_id=?");
		  stmt.setInt(1,catmodel.getCatid());
		  rs=stmt.executeQuery();
		  while(rs.next()) {
			  CategoryModel catmodel1=new CategoryModel();
			  catmodel1.setCatname(rs.getString(2));
			  list1.add(catmodel1);
		  }
		  return list1.size()>0?list1:null;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
		return null;
		}
	}
	

}
