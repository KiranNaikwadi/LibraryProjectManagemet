package org_Library_Repository;

import java.util.List;

import org_Library_Model.StudentModel;

public interface StudentRepository {
    public boolean isAddNewStudent(StudentModel studmodel);
    public List<StudentModel> getAllStudent();
    public boolean isDeleteStudentById(int studentid);
    public boolean isUpdateStudent(StudentModel studmodel);
    public List<StudentModel> viewStudentProfile(StudentModel studmodel);
	public List<StudentModel> searchStudentByAttribute(String str);
	public String getNameById(int s_id);
	public String getNameBySId(int id);
}
