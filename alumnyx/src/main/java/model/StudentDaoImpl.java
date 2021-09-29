package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import entities.StudentData;
import sessionUtils.SessionUtils;

public class StudentDaoImpl implements StudentDao {

	private Session getSession() {
		Configuration config = new Configuration();
		config.configure("hibernate.cfg.xml");
		SessionFactory sf = config.buildSessionFactory();
		Session session = sf.openSession();
		return session;
	}
	
	public StudentData insertData(StudentData record) {
		Session session = SessionUtils.getFactory().openSession();
		Transaction txn = session.beginTransaction();

		session.save(record);
		txn.commit();
		session.close();
		return record;
	}

	public StudentData updateStudentData(StudentData s) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
		session.update(s);
		txn.commit();
		session.close();
		return s;
	}

	public StudentData deleteData(StudentData student) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
		StudentData data = session.get(StudentData.class, student.getEmail());
		session.delete(data);
		txn.commit();
		session.close();
		return student;
	}

	public List<StudentData> getAllData() {
		Session session=getSession();
		Transaction tr = session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<StudentData> list1=session.createQuery("from StudentData").getResultList();
		tr.commit();
		session.close();
		return list1;
	}

	public StudentData studentLogin(StudentData record) {
		Session session = SessionUtils.getFactory().openSession();
		Transaction txn = session.beginTransaction();

		StudentData data = session.get(StudentData.class, record.getEmail());

		if (data.getEmail().equals(record.getEmail()) && data.getPassword().equals(record.getPassword())) {
			txn.commit();
			session.close();
			return data;
		}
		return null;
	}

	public StudentData getStudentbyEmail(StudentData record) {
		Session session = SessionUtils.getFactory().openSession();
		Transaction txn = session.beginTransaction();

		StudentData data = session.get(StudentData.class, record.getEmail());
		txn.commit();
		session.close();
		return data;
	}
	
	public StudentData updateData(StudentData data) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
		session.update(data);
		txn.commit();
		session.close();
		return data;
	}
	
	public StudentData changePassword(StudentData a) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
//		session.update(a);
		StudentData data = session.get(StudentData.class, a.getEmail());
		data.setPassword(a.getPassword());
		txn.commit();
		session.close();
		return a;
	}
}
