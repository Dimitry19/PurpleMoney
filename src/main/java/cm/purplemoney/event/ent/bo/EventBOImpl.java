package cm.purplemoney.event.ent.bo;

import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.event.ent.vo.EventVO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

@Component("eventBO")
public class EventBOImpl implements EventBO {


    private static final Logger log = LoggerFactory.getLogger(EventTypeBOImpl.class);

    @Resource(name = "hibernateConfig")
    HibernateConfig hibernateConfig;
    Session session;


    @Override
    public void addEvent(EventVO event) throws BusinessException{
        if(event!=null){
            String memberId=event.getMember().split(CommonUtils.COMMA_REGEX, 2)[0];
            String eventType=event.getEventType().split(CommonUtils.COMMA_REGEX, 2)[0];
            event.setMember(memberId);
            event.setEventType(eventType);
            session=hibernateConfig.getSession();
            Transaction tx=session.beginTransaction();
            Serializable serializable=session.save(EventVO.class.getName(),event);
            tx.commit();
        }
    }

    @Override
    public List<EventVO> allEvents(String association) throws BusinessException {
        session=hibernateConfig.getSession();
        Query query=session.createQuery("select e from Calendar e where association =:assId order by id");
        query.setParameter("assId",association);
        List events= null;
        try {
            events = query.list();


            JSONObject eventJson=new JSONObject();
            eventJson.put("id"  ,"001");
            eventJson.put("title" ,"DA-013G4201");
            eventJson.put("start"  ,"00103");
            eventJson.put("allDay"       ,"2017/04/12");
            eventJson.put("className","N");
            Date compareDate=new Date();

            //TODO donne le parametre className en fonction de la comparaison des dates





            /*id: 999,
                    title: 'Repeating Event',
                    start: new Date(y, m, d-3, 16, 0),
                    allDay: false,
                    className: 'info'*/

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
