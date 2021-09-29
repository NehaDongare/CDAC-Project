package sessionUtils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionUtils {
private static SessionFactory sessionfactory;
	
	public static SessionFactory getFactory() {
		if(sessionfactory == null || sessionfactory.isClosed()) {
			sessionfactory = new Configuration().configure().buildSessionFactory();
		}
		return sessionfactory;
	}
	public void closeFactory() {
		if(sessionfactory != null || sessionfactory.isOpen()) {
			sessionfactory.close();
		}
	}
}
