package cm.purplemoney.role.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.constants.PortalConstants;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.vo.RoleVO;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.util.List;


@Component("roleBO")
public class RoleBOImpl implements RoleBO {

    @Resource(name ="hibernateConfig")
    HibernateConfig hibernateConfig;
    Session session;

    public List<RoleVO> loadAllRoles() {

        session=hibernateConfig.getSession();
        Query query=session.getNamedQuery(RoleVO.QUERY_AVAILABE_ROLE);
        return query.list();
    }

    @Override
    public void addRole(RoleVO role) {
          session=hibernateConfig.getSession();
        Transaction tx=session.beginTransaction();
        session.save(RoleVO.class.getName(), role);

        tx.commit();
    }

    @Override
    public int  updateRoleByMember(String roleId) throws BusinessException {
        int  rs=0;
        if(!StringUtils.equals(roleId,PortalConstants.MEMBER_LABEL_KEY)){
            session=hibernateConfig.getSession();
            Transaction tx=session.beginTransaction();
            Query query=session.getNamedQuery(RoleVO.QUERY_UPDATE_ROLE);
            query.setParameter("role",roleId);
            rs=query.executeUpdate();
            tx.commit();

        }
        return rs;

    }

    @Override
    public RoleVO retrieveRoleFromMember(MemberVO member) throws BusinessException {
        session=hibernateConfig.getSession();
        String cQuery="from RoleVO where id.id=:id and";
        boolean isDesc=false;
        StringBuilder sb=new StringBuilder(cQuery);
        if(member.getRole()==null && StringUtils.isNotEmpty( member.getRoleDesc())) {
            sb.append("   description =:descp");
            isDesc=true;
        }else{
            sb.append("   id.role=:idRole ");
        }
        Query query=session.createQuery(sb.toString());
        query.setParameter("id",member.getId().getMemberId());
        if(isDesc){
            query.setParameter("descp",member.getRoleDesc());
        }else{
            query.setParameter("idRole",member.getRole());
        }
        RoleVO role=(RoleVO ) query.uniqueResult();

        return role;
    }
}
