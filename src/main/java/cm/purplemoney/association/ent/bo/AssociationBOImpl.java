package cm.purplemoney.association.ent.bo;

import java.util.List;


import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.group.ent.vo.GroupVO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.vo.RoleVO;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;


@Component("associationBO")
public class AssociationBOImpl implements AssociationBO {


	@Resource(name ="hibernateConfig")
	HibernateConfig hibernateConfig;
	Session session;


	public void addAssociation(AssociationVO association) {
		session=hibernateConfig.getSession();
		Transaction tx=session.beginTransaction();
		session.save(AssociationVO.class.getName(), association);

		tx.commit();
	}



	public List<AssociationVO> loadAllAssociations() {

		session=hibernateConfig.getSession();
		Query query=session.createQuery("from AssociationVO");
		return query.list();
	}

	@Override
	public AssociationVO associationInfoFromMember(MemberVO member) throws BusinessException {

		session=hibernateConfig.getSession();
		Query query=null;

		StringBuilder sb=new StringBuilder("from AssociationVO where ");


		if(member!=null && member.getId().getAssociationId()!=null) {
			sb.append("   id.id=:id");
			query=session.createQuery(sb.toString());
			query.setParameter("id",member.getId().getAssociationId());
			AssociationVO association=(AssociationVO ) query.uniqueResult();

			return association;
		}

		return null;
	}

}
