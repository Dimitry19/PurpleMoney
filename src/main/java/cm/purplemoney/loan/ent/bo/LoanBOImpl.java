package cm.purplemoney.loan.ent.bo;

import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.loan.ent.vo.LoanWrapper;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.bo.RoleBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigDecimal;
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

	@Override
	public boolean addLoan(LoanWrapper loanWrapper) throws BusinessException {

		Transaction tx =null;
		boolean saved=true;

		try{

			if(loanWrapper!=null) {
				session = hibernateConfig.getSession();
				tx = session.beginTransaction();
				LoanVO loan=loanWrapper.getLoan();
				if(loan!=null && StringUtils.isNotEmpty(loan.getId().getMmember().getId().getName())){
					String usernameParts[] = loan.getId().getMmember().getId().getName().split(CommonUtils.COMMA_REGEX, 2);
					loan.getId().getMmember().getId().setName(usernameParts[0]);
					BigDecimal importo=loan.getAmount().multiply(loan.getTax()).divide(new BigDecimal(100));
					loan.setAmountToBack(importo);
					session.saveOrUpdate(SessionVO.class.getName(), loan);
					tx.commit();
				}


			}
		}catch(Exception e){
			log.error("Error save loan " +e.getMessage());
			e.printStackTrace();
			tx.rollback();
			saved=false;

		}
		return saved;

	}
}
