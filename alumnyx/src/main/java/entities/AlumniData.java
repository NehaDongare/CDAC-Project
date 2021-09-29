package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AlumniData {

//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private int id;
	private String name;
	private String uName;
	@Id
	private String email;
	private long phoneno;
	private int graduationYear;
	private String category;
	@Column(unique = true)
	private long prn_no;
	private String password;

	public AlumniData() {
		super();
		// TODO Auto-generated constructor stub
	}

//	public AlumniData(int id, String name, String uName, String email, long phoneno, int graduationYear,
//			String category, long prn_no, String password) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.uName = uName;
//		this.email = email;
//		this.phoneno = phoneno;
//		this.graduationYear = graduationYear;
//		this.category = category;
//		this.prn_no = prn_no;
//		this.password = password;
//	}

	public AlumniData(String name, String uName, String email, long phoneno, int graduationYear, String category,
			long prn_no, String password) {
		super();
		this.name = name;
		this.uName = uName;
		this.email = email;
		this.phoneno = phoneno;
		this.graduationYear = graduationYear;
		this.category = category;
		this.prn_no = prn_no;
		this.password = password;
	}

	public AlumniData(String name, String uName, String email, long phoneno, int graduationYear, String category,
			long prn_no) {
		super();
		this.name = name;
		this.uName = uName;
		this.email = email;
		this.phoneno = phoneno;
		this.graduationYear = graduationYear;
		this.category = category;
		this.prn_no = prn_no;
	}

	public AlumniData(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}

	public AlumniData(long prn_no) {
		super();
		this.prn_no = prn_no;
	}

	public AlumniData(String email) {
		super();
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(long phoneno) {
		this.phoneno = phoneno;
	}

	public int getGraduationYear() {
		return graduationYear;
	}

	public void setGraduationYear(int graduationYear) {
		this.graduationYear = graduationYear;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getPrn_no() {
		return prn_no;
	}

	public void setPrn_no(long prn_no) {
		this.prn_no = prn_no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

//	@Override
//	public String toString() {
//		return "AlumniData [id=" + id + ", name=" + name + ", uName=" + uName + ", email=" + email + ", phoneno="
//				+ phoneno + ", graduationYear=" + graduationYear + ", category=" + category + ", prn_no=" + prn_no
//				+ ", password=" + password + "]";
//	}

}
