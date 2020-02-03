package cm.purplemoney.event.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBOImpl;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.event.ent.vo.EventTypeVO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

@Component("eventTypeBO")
public class EventTypeBOImpl extends CommonBOImpl implements EventTypeBO {

    private static final Logger log = LoggerFactory.getLogger(EventTypeBOImpl.class);

    @Resource(name = "hibernateConfig")
    HibernateConfig hibernateConfig;
    Session session;


    @Override
    public void addEventType(EventTypeVO eventType) throws BusinessException{
        if(eventType!=null){
            session=hibernateConfig.getSession();

            Transaction tx=session.beginTransaction();
            Serializable serializable=session.save(EventTypeVO.class.getName(),eventType);
            tx.commit();
        }
    }

    @Override
    public List<EventTypeVO> allEventsType(String lang) throws BusinessException {
        session=hibernateConfig.getSession();
        Query query=session.getNamedQuery(EventTypeVO.ALL);
        query.setParameter("lang", lang);
        List<EventTypeVO> eventTypes= null;
        try {
            eventTypes = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return eventTypes;
    }
}
