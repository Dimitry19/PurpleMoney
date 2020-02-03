package cm.purplemoney.loan.ent.bo;

import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.common.ent.bo.CommonBO;
import cm.purplemoney.common.ent.bo.CommonBOImpl;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.event.ent.bo.EventBO;
import cm.purplemoney.event.ent.vo.EventTypeVO;
import cm.purplemoney.event.ent.vo.EventVO;
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
public class LoanBOImpl extends CommonBOImpl implements LoanBO  {
	private static final Logger log = LoggerFactory.getLogger(LoanBOImpl.class);


	@Resource(name = "roleBO")
	RoleBO roleBO;

	@Resource(name = "eventBO")
	EventBO eventBO;



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


		try{

			if(loanWrapper!=null) {
				session = hibernateConfig.getSession();
				tx = session.beginTransaction();
				LoanVO loan=loanWrapper.getLoan();
				if(loan!=null && StringUtils.isNotEmpty(loan.getMmember().getId().getName())){
					String usernameParts[] = loan.getMmember().getId().getName().split(CommonUtils.COMMA_REGEX, 2);
					loan.getMmember().getId().setName(usernameParts[0]);
					BigDecimal importo=loan.getAmount().multiply(loan.getTax()).divide(new BigDecimal(100));
					loan.setAmountToBack(importo);
					session.saveOrUpdate(SessionVO.class.getName(), loan);

					EventVO event=new EventVO();
					event.setEventType("RBM/fr");
					event.setMember(loan.getId().getMmember());
					event.setAssociationId(loan.getId().getAssociationId());
					event.setData(loan.getLoanDateRemb());
					eventBO.addEvent(event);
					tx.commit();
					  saved=true;
				}


			}
		}catch(Exception e){
			log.error("Error save loan " +e.getMessage());
			e.printStackTrace();
			tx.rollback();
		}

		return saved;

	}
	@Override
	public boolean addLoan(LoanVO loan, String language) throws BusinessException {

		Transaction tx =null;


		try{

			if(loan!=null) {
				session = hibernateConfig.getSession();
				tx = session.beginTransaction();

				if(loan!=null && StringUtils.isNotEmpty(loan.getId().getMmember())){
					String usernameParts[] = loan.getId().getMmember().split(CommonUtils.COMMA_REGEX, 2);
					loan.getMmember().getId().setName(usernameParts[0]);
					BigDecimal importo=loan.getAmount().multiply(loan.getTax()).divide(new BigDecimal(100));
					loan.setAmountToBack(importo);
					session.saveOrUpdate(LoanVO.class.getName(), loan);
					addEvent(loan,language);
					tx.commit();
					saved=true;
				}


			}
		}catch(Exception e){
			log.error("Error save loan " +e.getMessage());
			e.printStackTrace();
			tx.rollback();
		}
		return saved;

	}

	private void addEvent(LoanVO loan, String language) throws BusinessException {
		EventVO event=new EventVO();
		switch (language.charAt(0)){
			case 'e':
				event.setEventType("RBM/en");
				break;
			case 'i':
				event.setEventType("RBM/it");
				break;
			case 'f':
				event.setEventType("RBM/fr");
				break;

		}
		event.setMember(loan.getId().getMmember());
		event.setAssociationId(loan.getId().getAssociationId());
		event.setData(loan.getLoanDateRemb());

		eventBO.addEvent(event);
	}
}
