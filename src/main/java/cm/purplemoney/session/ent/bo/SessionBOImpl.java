package cm.purplemoney.session.ent.bo;


import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.session.ent.wrapper.SessionSearchWr;
import cm.purplemoney.config.HibernateConfig;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("sessionBO")
public class SessionBOImpl implements SessionBO {

    @Resource(name = "hibernateConfig")
    HibernateConfig hibernateConfig;
    Session session;

    public List<SessionVO> loadAllSession() {

        session=hibernateConfig.getSession();
        Query query=session.createQuery("from SessionVO");
        return query.list();
    }


    @Override
    public void addSession(SessionVO amountSession) {

        if(amountSession!=null){
            session=hibernateConfig.getSession();
            Transaction tx=session.beginTransaction();

            String usernameParts[] = amountSession.getId().getMember().split(CommonUtils.SPACE_REGEX, 2);
            amountSession.getId().setMember(usernameParts[0]);
            session.saveOrUpdate(SessionVO.class.getName(), amountSession);
            tx.commit();
        }
    }

    @Override
    public List<SessionVO> consultSession(SessionSearchWr ssw) throws BusinessException {
        if(ssw!=null){
            if(ssw.getReceiver().getId().getName()==null && ssw.getFrom()==null && ssw.getTo()==null){
                return loadAllSession();
            }else{
                return null;
            }
        }
        return null;
    }


}
