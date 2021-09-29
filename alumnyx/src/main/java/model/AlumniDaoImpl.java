package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


import entities.AlumniData;

import sessionUtils.SessionUtils;

public class AlumniDaoImpl implements AlumniDao {
	
	private Session getSession() {
		Configuration config = new Configuration();
		config.configure("hibernate.cfg.xml");
		SessionFactory sf = config.buildSessionFactory();
		Session session = sf.openSession();
		return session;
	}

	public AlumniData insertData(AlumniData record) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();

		session.save(record);
		txn.commit();
		session.close();
		return record;
	}

	public AlumniData updateData(AlumniData alumni) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
		session.update(alumni);
		txn.commit();
		session.close();
		return alumni;
	}

	public AlumniData deleteData(AlumniData alumni) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
		
		AlumniData data = session.get(AlumniData.class, alumni.getEmail());
		
		session.delete(data);
		txn.commit();
		session.close();
		return alumni;
	}

	public List<AlumniData> getAllData() {
		Session session=getSession();
		Transaction tr = session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<AlumniData> list=session.createQuery("from AlumniData").getResultList();
		tr.commit();
		session.close();
		return list;
	}

	public AlumniData aluminiLogin(AlumniData record) {
		Session session = SessionUtils.getFactory().openSession();
		Transaction txn = session.beginTransaction();

		AlumniData data = session.get(AlumniData.class, record.getEmail());

		if (data.getEmail().equals(record.getEmail()) && data.getPassword().equals(record.getPassword())) {
			txn.commit();
			session.close();
			return data;
		}
		return null;
	}

	public AlumniData getAlumnibyEmail(AlumniData record) {
		Session session = SessionUtils.getFactory().openSession();
		Transaction txn = session.beginTransaction();

		AlumniData data = session.get(AlumniData.class, record.getEmail());
		txn.commit();
		session.close();
		return data;
	}
	
	public boolean updateProfileData(AlumniData a) {
		
////	try {
//	Session session = SessionUtils.getFactory().openSession();
//	Transaction txn = session.beginTransaction();
//	
////	AlumniData dataUpd = session.get(AlumniData.class, a.getEmail());
//	AlumniData dataUpd = (AlumniData) session.createQuery("FROM AlumniData AL where AL.email= :email")
//			.setParameter("email", a.getEmail()).uniqueResult();
////	session.update(a);
//	dataUpd.setName(a.getName());
//	dataUpd.setuName(a.getuName());
//	dataUpd.setPhoneno(a.getPhoneno());
//	dataUpd.setCatagory(a.getCatagory());
//	dataUpd.setEmail(a.getEmail());
//	dataUpd.setGraduationYear(a.getGraduationYear());
//	dataUpd.setPrn_no(a.getPrn_no());
//	dataUpd.setPassword(a.getPassword());
//	txn.commit();
//	session.close();
//	return dataUpd;
////}catch(Exception e) {
////	e.printStackTrace();
////	return a;
////}
//
	Transaction transaction = null;
	Session session = SessionUtils.getFactory().openSession();
		// start a transaction
		transaction = session.beginTransaction();
		// update the MobileDetails object
		session.update(a);
		// commit transaction
		transaction.commit();
		session.close();
	
	return true;

}
	
	public AlumniData changePassword(AlumniData a) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
//		session.update(a);
		AlumniData data = session.get(AlumniData.class, a.getEmail());
		data.setPassword(a.getPassword());
		txn.commit();
		session.close();
		return a;
		
	}

}
