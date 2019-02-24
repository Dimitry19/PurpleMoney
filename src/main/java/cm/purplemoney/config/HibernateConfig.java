package cm.purplemoney.config;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.*;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//@Transactional(readOnly = true, propagation = Propagation.REQUIRED, rollbackFor = {java.lang.Exception.class})
@Component("hibernateConfig")
public class HibernateConfig {

	private SessionFactory sessionFactory;


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
