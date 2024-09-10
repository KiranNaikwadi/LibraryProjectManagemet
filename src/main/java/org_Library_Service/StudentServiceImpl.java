package org_Library_Service;

import java.util.List;

import org_Library_Model.StudentModel;
import org_Library_Repository.StudentRepository;
import org_Library_Repository.StudentRepositoryImpl;

public class StudentServiceImpl implements StudentService {
     StudentRepository studrepo=new StudentRepositoryImpl();
	@Override
	public boolean isAddNewStudent(StudentModel studmodel) {
		// TODO Auto-generated method stub
		return studrepo.isAddNewStudent(studmodel);
	}
	@Override
	public List<StudentModel> getAllStudent() {
		// TODO Auto-generated method stub
		return studrepo.getAllStudent();
	}
	@Override
	public boolean isDeleteStudentById(int studentid) {
		return studrepo.isDeleteStudentById(studentid);
	}
	@Override
	public boolean isUpdateStudent(StudentModel studmodel) {
		// TODO Auto-generated method stub
		return studrepo.isUpdateStudent(studmodel);
	}
	@Override
	public List<StudentModel> viewStudentProfile(StudentModel studmodel) {
		// TODO Auto-generated method stub
		return studrepo.viewStudentProfile(studmodel);
	}
	@Override
	public List<StudentModel> searchStudentByAttribute(String str) {
		// TODO Auto-generated method stub
		return studrepo.searchStudentByAttribute(str);
	}
	@Override
	public String getNameById(int s_id) {
		// TODO Auto-generated method stub
		return studrepo.getNameById(s_id);
	}
	@Override
	public String getNameBySId(int id) {
		// TODO Auto-generated method stub
		return studrepo.getNameBySId(id);
	}

}
