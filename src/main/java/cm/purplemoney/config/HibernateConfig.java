package cm.purplemoney.config;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.*;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//@Transactional(readOnly = true, propagation = Propagation.REQUIRED, rollbackFor = {java.lang.Exception.class})
@Component("hibernateConfig")
public class HibernateConfig {

	private SessionFactory sessionFactory;

	private static SessionFactory sessionFactory2 = buildSessionFactory();
	private static SessionFactory buildSessionFactory() {
		/*try {
			// Create the SessionFactory from hibernate.cfg.xml
			AnnotationConfiguration configuration = new AnnotationConfiguration();

        	sessionFactory = configuration.configure().buildSessionFactory();
			return sessionFactory;

		}
		catch (Throwable ex) {
			// Make sure you log the exception, as it might be swallowed
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}*/
		try{
			StandardServiceRegistry standardRegistry =new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
			Metadata metaData =	new MetadataSources(standardRegistry).getMetadataBuilder().build();
			sessionFactory2 = metaData.getSessionFactoryBuilder().build();

			return sessionFactory2;
		}
		catch (Throwable ex) {
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}

	}

	public   Session getSession() {

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
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}



	public static SessionFactory getSessionFactory2() {
		return sessionFactory2;
	}

	public static void shutdown() {
		// Close caches and connection pools
		getSessionFactory2().close();
	}



	public void save(String className,Object obj){

		Session session ;
		try {
			session = sessionFactory.getCurrentSession();
            Transaction tx=session.beginTransaction();
			if(StringUtils.isEmpty(className)){
				session.save(className,obj);
			}else{
				session.save(obj);
			}
            tx.commit();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		session.setFlushMode(FlushMode.AUTO);
	}

	public void update(String className,Object obj){

		Session session ;
		try {
			session = sessionFactory.getCurrentSession();
            Transaction tx=session.beginTransaction();

			if(StringUtils.isEmpty(className)){
				session.update(className,obj);
			}else{
				session.update(obj);
			}

            tx.commit();

		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		session.setFlushMode(FlushMode.AUTO);
	}
}
