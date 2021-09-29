package model;

import java.util.List;

import entities.AlumniData;

public interface AlumniDao {
	
	public AlumniData insertData(AlumniData record);
	public AlumniData updateData(AlumniData a);
	public AlumniData deleteData(AlumniData a);
	public List<AlumniData> getAllData();
	public AlumniData getAlumnibyEmail(AlumniData a);
	public AlumniData aluminiLogin(AlumniData record);
	public boolean updateProfileData(AlumniData a);
	public AlumniData changePassword(AlumniData a);
}
