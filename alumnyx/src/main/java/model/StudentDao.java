package model;

import java.util.List;


import entities.StudentData;


public interface StudentDao {
	
	public StudentData insertData(StudentData record);
	public StudentData updateStudentData(StudentData s);
	public StudentData deleteData(StudentData s);
	public List<StudentData> getAllData();
	public StudentData getStudentbyEmail(StudentData s);
	public StudentData studentLogin(StudentData record);
	public StudentData updateData(StudentData data);
	public StudentData changePassword(StudentData a);
	
}
