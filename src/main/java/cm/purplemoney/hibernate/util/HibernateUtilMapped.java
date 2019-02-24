package cm.purplemoney.hibernate.util;

import org.hibernate.FlushMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class HibernateUtilMapped{
	
	//ApplicationContext context= new ClassPathXmlApplicationContext("common.xml");
	static HibernateUtilMapped instance;
	public static synchronized HibernateUtilMapped getInstance()
	{
		if (instance == null) instance = new HibernateUtilMapped();
		return instance;
	}

	public   Session getSession(SessionFactory sessionFactory) {
		
		Session session ;
		//this.sessionFactory=(SessionFactory) context.getBean("sessionFactory");
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		session.setFlushMode(FlushMode.AUTO);
		return session;
	}

}
