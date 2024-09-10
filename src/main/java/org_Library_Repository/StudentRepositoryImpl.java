package org_Library_Repository;

import java.util.ArrayList;
import java.util.List;

import org_Library_Config.DBConfig;
import org_Library_Model.StudentModel;

public class StudentRepositoryImpl extends DBConfig implements StudentRepository {
	int value;
	private int studentid;
	List<StudentModel> list;
	public int getMaxId() {
		try {
			stmt=conn.prepareStatement("select max(st_id) from student");
			rs=stmt.executeQuery();
			if(rs.next()) {
   			 studentid=rs.getInt(1);
   		 }
   		  ++studentid;
   		 
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return 0;
		}
		return studentid;
		
	}
	
	public boolean isAddNewStudent(StudentModel studmodel) {
		int studentid=this.getMaxId();
		if(studentid!=0) {
		try {
			stmt=conn.prepareStatement("insert into student(st_id,st_name,st_contact,st_email,st_year) values(?,?,?,?,?)");
			stmt.setInt(1, studentid);
			stmt.setString(2,studmodel.getStudentname());
			stmt.setString(3,studmodel.getContact());
			stmt.setString(4,studmodel.getEmail());
			stmt.setString(5,studmodel.getYear());
			int value=stmt.executeUpdate();
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
	public List<StudentModel> getAllStudent() {
		try {
			List<StudentModel> list=new ArrayList<StudentModel>();
			stmt=conn.prepareStatement("select * from student");
			rs=stmt.executeQuery();
			while(rs.next()) {
				StudentModel studmodel=new StudentModel();
				studmodel.setStudentid(rs.getInt(1));
				studmodel.setStudentname(rs.getString(2));
				studmodel.setContact(rs.getString(3));
				studmodel.setEmail(rs.getString(4));
				studmodel.setYear(rs.getString(5));
				
				list.add(studmodel);
			}
			return list.size()>0?list:null;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return null;
		}
		
	}

	@Override
	public boolean isDeleteStudentById(int studentid) {
		try {
			stmt=conn.prepareStatement("delete from student where st_id=?");
			stmt.setInt(1, studentid);
			int value=stmt.executeUpdate();
			return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return false;
		}
		
	}

	@Override
	public boolean isUpdateStudent(StudentModel studmodel) {
		try {
			stmt=conn.prepareStatement("update student set st_name=?,st_contact=?,st_email=?,st_year=? where st_id=?");
			stmt.setInt(5, studmodel.getStudentid());
			stmt.setString(1,studmodel.getStudentname());
			stmt.setString(2,studmodel.getContact());
			stmt.setString(3,studmodel.getEmail());
			stmt.setString(4,studmodel.getYear());
			int value=stmt.executeUpdate();
			return value>0?true:false;
			
		}
		catch(Exception ex) {
			System.out.println("Error is "+ex);
			return false;
		}
	}

	@Override
	public List<StudentModel> viewStudentProfile(StudentModel studmodel){
		
		
		   try
		   {
			   list=new ArrayList<StudentModel>();
			   stmt=conn.prepareStatement("select * from student where st_id=?");
			   stmt.setInt(1, studmodel.getStudentid());
			   rs=stmt.executeQuery();
			   while(rs.next())
			   {
				   StudentModel stModel1=new StudentModel();
				   stModel1.setStudentname(rs.getString(2));
				   stModel1.setContact(rs.getString(3));
				   stModel1.setEmail(rs.getString(4));
				   stModel1.setYear(rs.getString(5));
				   list.add(stModel1);
			   }
			   
			   return list.size()>0?list:null;
		   }
		   
		   catch(Exception ex) {
			   System.out.println("Error is "+ex);
			   return null;
		   } 
		   
		   }
	public List<StudentModel> searchStudentByAttribute(String str)
	{
		try
		{
			list=new ArrayList<StudentModel>();
			stmt=conn.prepareStatement("select * from student where st_name like '%"+str+"%' or st_contact like '%"+str+"%' or st_email like '%"+str+"%' or st_year like '%"+str+"%'");
		    rs=stmt.executeQuery();
		    while(rs.next())
		    {
		    	StudentModel stModel=new StudentModel();
		    	stModel.setStudentid(rs.getInt(1));
		    	stModel.setStudentname(rs.getString(2));
		    	stModel.setContact(rs.getString(3));
		    	stModel.setEmail(rs.getString(4));
		    	stModel.setYear(rs.getString(5));
		    	list.add(stModel);
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
	public String getNameById(int s_id) {
		try
		{
			stmt=conn.prepareStatement("select * from student where st_id=?");
			stmt.setInt(1, s_id);
			rs=stmt.executeQuery();
			if(rs.next())
			{
				return rs.getString(2);
			}
			return null;
		}
		catch(Exception ex)
		{
			System.out.println("Error is "+ex);
			return null;
		}
		

	}

	@Override
	public String getNameBySId(int id) {
		try
		{
			stmt=conn.prepareStatement("select * from admin where admin_id=?");
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs.next())
			{  System.out.println("hii");
				System.out.println(rs.getString(1));
				return rs.getString(1);
			}
			return null;
		}
		catch(Exception ex)
		{
			System.out.println("error is "+ex);
			return null;
		}

	}

	
	
	
}	
		




