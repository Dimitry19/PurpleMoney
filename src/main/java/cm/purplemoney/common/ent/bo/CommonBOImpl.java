package cm.purplemoney.common.ent.bo;

import cm.purplemoney.config.HibernateConfig;
import org.hibernate.Session;

import javax.annotation.Resource;

public class CommonBOImpl implements CommonBO{

	@Resource(name = "hibernateConfig")
	protected HibernateConfig hibernateConfig;
	protected Session session;
	protected boolean saved=false;
}
