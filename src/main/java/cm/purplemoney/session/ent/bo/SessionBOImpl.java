package cm.purplemoney.session.ent.bo;


import cam.common.CommonUtils;
import cam.common.date.utils.DateUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.session.ent.wrapper.SessionSearchWr;
import cm.purplemoney.config.HibernateConfig;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.persistence.TypedQuery;
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

            if(StringUtils.isEmpty(ssw.getMember().getId().getMemberId())&& ssw.getFrom()==null && ssw.getTo()==null){
                return loadAllSession();
            }else{

                session= hibernateConfig.getSession();
                String selectQuery=composeWhere(ssw);
                Query query=session.createQuery(selectQuery);
                setParameters(query, ssw);
                return query.list();
            }
        }
        return null;
    }

    private String composeWhere(SessionSearchWr ssw){
        String username= ssw.getMember().getId().getMemberId().split(CommonUtils.SPACE_REGEX, 2)[0];
        Date dateFrom=ssw.getFrom();
        Date dateTo=ssw.getTo();


        StringBuilder sbWhere=new StringBuilder(" from SessionVO where id.associationId = :ass ");

        if(ssw.isStatus()){
            sbWhere.append(" and status = :sts");
        }
        if(StringUtils.isNotEmpty(username)){
            sbWhere.append(" and id.member = :mbr");
        }
        if(dateFrom!=null && dateTo!=null){
            sbWhere.append(" and id.date between :from and :to");
        }
        if(dateFrom==null && dateTo!=null){
            sbWhere.append("and id.date <= :to");
        }
        if(dateFrom!=null && dateTo==null){
            sbWhere.append("and id.date >= :from");
        }


        return sbWhere.toString();

    }

    private void setParameters(Query query,SessionSearchWr ssw){

        if(ssw!=null){
            String username= ssw.getMember().getId().getMemberId().split(CommonUtils.SPACE_REGEX, 2)[0];
            Date dateFrom=ssw.getFrom();
            Date dateTo=ssw.getTo();

            query.setParameter("ass", ssw.getCompanyId().trim());

            String dateT=DateUtils.formatDateForQuery(dateTo);
            String dateF=DateUtils.formatDateForQuery(dateFrom);


            if(ssw.isStatus()){
                query.setParameter("sts",ssw.isStatus());
            }

            if(StringUtils.isNotEmpty(username)){
                query.setParameter("mbr", username.trim());
            }
            if(dateFrom!=null && dateTo!=null){
                query.setParameter("from", dateFrom);
                query.setParameter("to", dateTo);
            }
            if(dateFrom==null && dateTo!=null){
                query.setParameter("to", dateTo);
            }
            if(dateFrom!=null && dateTo==null){
                query.setParameter("from", dateFrom);
            }
        }
    }


}
