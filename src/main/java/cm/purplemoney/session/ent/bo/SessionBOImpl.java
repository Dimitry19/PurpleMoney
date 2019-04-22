package cm.purplemoney.session.ent.bo;


import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.session.ent.wrapper.SessionSearchWr;
import cm.purplemoney.config.HibernateConfig;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
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

            if(ssw.getReceiver().getId().getMemberId()==null && ssw.getFrom()==null && ssw.getTo()==null){
                return loadAllSession();
            }else{

                String username= ssw.getReceiver().getId().getMemberId().split(CommonUtils.SPACE_REGEX, 2)[0];
                Date dateFrom=ssw.getFrom();
                Date dateTo=ssw.getTo();
                session= hibernateConfig.getSession();
                String selectQuery=composeWhere(dateFrom,dateTo , username, ssw.getCompanyId());
                Query query=session.createSQLQuery(selectQuery);
                List<SessionVO> sessions=query.list();
                return sessions;
            }
        }
        return null;
    }

    private String composeWhere(Date dateFrom,Date dateTo, String username, String associationId){
        StringBuilder sbWhere=new StringBuilder("select s SessionVO s where id.associationId = '");
        sbWhere.append(associationId);
        sbWhere.append("'");
     //   String selectQuery="select s SessionVO s where id.associationId = "+associationId;

        if(StringUtils.isNotEmpty(username)){
            sbWhere.append(" and  id.member = '"+username);
            sbWhere.append("'");

        }
        if(dateFrom!=null && dateTo!=null){
            sbWhere.append(" and  id.date>='"+dateFrom);
            sbWhere.append(" '");
            sbWhere.append(" and  id.date=<'"+dateTo);
            sbWhere.append(" '");
        }
        if(dateFrom==null && dateTo!=null){
            sbWhere.append(" and  id.date=<'"+dateTo);
            sbWhere.append("'");
        }
        if(dateFrom!=null && dateTo==null){
            sbWhere.append(" and  id.date>='"+dateFrom);
            sbWhere.append("'");
        }

        return sbWhere.toString();

    }


}
