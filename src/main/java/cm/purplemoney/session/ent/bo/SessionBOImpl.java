package cm.purplemoney.session.ent.bo;


import cam.common.CommonUtils;
import cam.common.date.utils.DateUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.common.ent.bo.CommonBOImpl;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.session.ent.wrapper.SessionSearchWr;
import cm.purplemoney.config.HibernateConfig;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Component("sessionBO")
public class SessionBOImpl extends CommonBOImpl implements SessionBO {

    private static final Logger log = LoggerFactory.getLogger(SessionBOImpl.class);

    @Resource(name = "hibernateConfig")
    HibernateConfig hibernateConfig;
    Session session;

    public List<SessionVO> loadAllSession() {
        session=hibernateConfig.getSession();
        Query query=session.createQuery("from SessionVO");
        List<SessionVO> sessions=query.list();
        return sessions;
    }


    @Override
    public boolean addSession(SessionVO amountSession) throws BusinessException{

        Transaction tx =null;
        boolean saved=true;

        try{

            if(amountSession!=null && StringUtils.isNotEmpty(amountSession.getMmember().getId().getName())) {
                session = hibernateConfig.getSession();
                 tx = session.beginTransaction();

                String usernameParts[] = amountSession.getMmember().getId().getName().split(CommonUtils.COMMA_REGEX, 2);
                amountSession.getMmember().getId().setName(usernameParts[0]);
                amountSession.getId().setMember(usernameParts[0]);
                session.saveOrUpdate(SessionVO.class.getName(), amountSession);
                tx.commit();

            }
        }catch(Exception e){
            log.error("Error save session " +e.getMessage());
            e.printStackTrace();
            tx.rollback();
            saved=false;

        }
        return saved;
    }

    @Override
    public List<SessionVO> consultSession(SessionSearchWr ssw) throws BusinessException {

        try{
            if(ssw!=null){

                if(!ssw.isStatus() && StringUtils.isEmpty(ssw.getMember().getId().getName())&& ssw.getFrom()==null && ssw.getTo()==null){
                    return loadAllSession();
                }else{

                    session= hibernateConfig.getSession();
                    String selectQuery=composeWhere(ssw);
                    Query query=session.createQuery(selectQuery);
                    setParameters(query, ssw);
                    return query.list();
                }
            }
        }catch (Exception e){

            log.error("Error consult session" +e.getMessage());
            e.printStackTrace();

        }
        return null;

    }

    private String composeWhere(SessionSearchWr ssw){
        String username= ssw.getMember().getId().getName().split(CommonUtils.SPACE_REGEX, 2)[0];//ssw.getMember().getId().getMemberId().split(CommonUtils.SPACE_REGEX, 2)[0];
        Date dateFrom=ssw.getFrom();
        Date dateTo=ssw.getTo();


        StringBuilder sbWhere=new StringBuilder(" from SessionVO where id.associationId = :ass ");

        if(ssw.isStatus()){
            sbWhere.append(" and status = :sts");
        }
        if(StringUtils.isNotEmpty(username)){
            sbWhere.append(" and mmember.id.name = :mbr");
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
            String username= ssw.getMember().getId().getName().split(CommonUtils.SPACE_REGEX, 2)[0];//ssw.getMember().getId().getMemberId().split(CommonUtils.SPACE_REGEX, 2)[0];
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

    @Override
        public SessionVO frequenceByMember(MemberVO member)  {
            try{
                session= hibernateConfig.getSession();
                if(member!=null){
                    SessionVO sess=null;
                    sess=query(  member,  sess,  'P');
                    sess=query(  member,  sess,  'A');
                    sess.setMmember(member);
                    return sess;
                }
            }catch (Exception e){
                log.error("Error frequenceByMember" +e.getMessage());
                e.printStackTrace();
            }
            return null;
        }

        private SessionVO query(MemberVO member,SessionVO sess,char freq){

            SQLQuery query=session.createSQLQuery("SELECT COUNT(FREQUENCE) AS PRS from SESSION WHERE R_ASSOCIATION=:ass    AND  R_MEMBER=:mbr AND  FREQUENCE=:freq GROUP BY R_MEMBER,R_ASSOCIATION");
            query.setParameter("ass", member.getId().getAssociationId());
            query.setParameter("mbr", member.getId().getName());
            query.setParameter("freq", freq);
            List<BigInteger> rows = query.list();
            for(BigInteger row : rows){

                if(sess==null){
                    sess=new SessionVO();
                }
                switch (freq){
                    case 'P':
                        sess.setFrequencePresence(Integer.valueOf(row.toString()));
                        break;
                    case 'A':
                        sess.setFrequenceAbsence(Integer.valueOf(row.toString()));
                        break;
                }
            }
            return sess;
        }
}
