package cm.purplemoney.session.ent.bo;


import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.session.ent.wrapper.AmountSearchWr;
import cm.purplemoney.config.HibernateConfig;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("amountBO")
public class SessionBOImpl implements SessionBO {

    @Resource(name = "hibernateConfig")
    HibernateConfig hibernateConfig;
    Session session;

    public List<SessionVO> loadAllAmount() {

        session=hibernateConfig.getSession();
        Query query=session.createQuery("from AmountVO");
        return query.list();
    }


    @Override
    public void addAmount(SessionVO amount) {
        if(amount!=null){

        session=hibernateConfig.getSession();
       Transaction tx=session.beginTransaction();
            session.saveOrUpdate(SessionVO.class.getName(), amount);

        tx.commit();
        }
    }

    @Override
    public List<SessionVO> searcheAmount(AmountSearchWr asw) throws BusinessException {
        if(asw!=null){
            if(asw.getReceiver().getId().getName()==null && asw.getFrom()==null && asw.getTo()==null){
                return loadAllAmount();
            }else{
                return null;
            }
        }
        return null;
    }


}
