package cm.purplemoney.loan.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.bo.RoleBO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("loanBO")
public class LoanBOImpl implements LoanBO {
	private static final Logger log = LoggerFactory.getLogger(LoanBOImpl.class);

	@Resource(name = "hibernateConfig")
	HibernateConfig hibernateConfig;

	@Resource(name = "roleBO")
	RoleBO roleBO;

	@Resource(name = "associationBO")
	AssociationBO associationBO;

	Session session;

	@Override
	public List loans() throws BusinessException {

		session=hibernateConfig.getSession();
		Query query=session.getNamedQuery(LoanVO.ALL);

		List<LoanVO> loans= null;
		try {
			loans = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return loans;

	}
}
