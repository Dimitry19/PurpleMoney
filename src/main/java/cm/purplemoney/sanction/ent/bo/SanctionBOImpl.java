package cm.purplemoney.sanction.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.bo.RoleBO;
import cm.purplemoney.sanction.ent.vo.SanctionVO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

@Component("sanctionBO")
public class SanctionBOImpl implements SanctionBO {
    private static final Logger log = LoggerFactory.getLogger(SanctionBOImpl.class);

    @Resource(name = "hibernateConfig")
    HibernateConfig hibernateConfig;

    @Resource(name = "roleBO")
    RoleBO roleBO;
    @Resource(name = "associationBO")
    AssociationBO associationBO;

    Session session;



    @Override
    public void addSanction(SanctionVO sanction) throws BusinessException {
        if(sanction!=null){
            session=hibernateConfig.getSession();

            Transaction tx=session.beginTransaction();
            Serializable serializable=session.save(SanctionVO.class.getName(),sanction);
            if(serializable!=null){

            }
            tx.commit();
        }
    }

    @Override
    public List<SanctionVO> allSanctions(String association) throws BusinessException {
        session=hibernateConfig.getSession();
        Query query=session.getNamedQuery(SanctionVO.ALL);
        query.setParameter("ass", association);

        List<SanctionVO> sanctions=null;
        try {
            sanctions = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sanctions;
    }

    @Override
    public SanctionVO findSanctionByUser(MemberVO member) throws BusinessException {
        session=hibernateConfig.getSession();
        Query query=session.getNamedQuery(SanctionVO.FINDBYMEMBER);
        query.setParameter("mname", member.getId().getName());
        query.setParameter("ass", member.getId().getMemberId());
        return (SanctionVO) query.uniqueResult();
    }

    @Override
    public String[] autocomplete(String search, String association) throws BusinessException {
        return new String[0];
    }
}
