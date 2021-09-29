package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import entities.EventData;
import sessionUtils.SessionUtils;

public class EventDaoImpl implements EventDao {
	
	private Session getSession() {
		Configuration config = new Configuration();
		config.configure("hibernate.cfg.xml");
		SessionFactory sf = config.buildSessionFactory();
		Session session = sf.openSession();
		return session;
	}

	public EventData insertData(EventData record) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();

		session.save(record);
		txn.commit();
		session.close();
		return record;
	}

	public EventData updateData(EventData event) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
		
		session.update(event);
		txn.commit();
		session.close();
		return event;
	}

	public EventData deleteData(EventData event) {
		Session session = getSession();
		Transaction txn = session.beginTransaction();
		
		EventData data = session.get(EventData.class, event.getId());
		
		session.delete(data);
		txn.commit();
		session.close();
		return event;
	}

	public List<EventData> getAllData() {
		
		Session session = getSession();
		Transaction tr = session.beginTransaction();
		@SuppressWarnings("unchecked")
		List<EventData> list=session.createQuery("from EventData").getResultList();
		tr.commit();
		session.close();
		return list;
	}

	public EventData getEventbyId(EventData record) {
		
		Session session = SessionUtils.getFactory().openSession();
		Transaction txn = session.beginTransaction();

		EventData data = session.get(EventData.class, record.getId());
		txn.commit();
		session.close();
		return data;
	}
}

