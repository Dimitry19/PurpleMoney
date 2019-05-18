package cm.purplemoney.event.ent.bo;

import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.event.ent.vo.EventTypeVO;
import cm.purplemoney.event.ent.vo.EventVO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

@Component("eventBO")
public class EventBOImpl implements EventBO {


    private static final Logger log = LoggerFactory.getLogger(EventTypeBOImpl.class);

    @Resource(name = "hibernateConfig")
    HibernateConfig hibernateConfig;
    Session session;


    @Override
    public void addEvent(EventVO event) throws BusinessException{
        if(event!=null){
            String memberId=event.getMember().split(CommonUtils.SPACE_REGEX, 2)[0];
            event.setMember(memberId);
            session=hibernateConfig.getSession();
            Transaction tx=session.beginTransaction();
            Serializable serializable=session.save(EventVO.class.getName(),event);
            tx.commit();
        }
    }

    @Override
    public List<EventVO> allEvents() throws BusinessException {
        session=hibernateConfig.getSession();
        Query query=session.getNamedQuery(EventVO.ALL);
        List<EventVO> events= null;
        try {
            events = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return events;
    }

    @Override
    public void deleteEvent(EventVO event) throws BusinessException{
        if(event!=null){

        }
    }
}
