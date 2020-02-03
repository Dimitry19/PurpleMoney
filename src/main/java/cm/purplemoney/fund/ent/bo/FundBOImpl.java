package cm.purplemoney.fund.ent.bo;

import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.common.ent.bo.CommonBOImpl;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.fund.ent.vo.FundVO;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberIdVO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.bo.RoleBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component("fundBO")
public class FundBOImpl extends CommonBOImpl implements FundBO {
	private static final Logger log = LoggerFactory.getLogger(FundBOImpl.class);

	@Resource(name = "memberBO")
	private MemberBO memberBO;



	@Override
	public List funds() throws BusinessException {

		session=hibernateConfig.getSession();
		Query query=session.getNamedQuery(FundVO.ALL);

		List<FundVO> funds= new ArrayList();
		List<FundVO> fundsTmp= null;
		try {
			fundsTmp = query.list();
			if(CollectionUtils.isNotEmpty(fundsTmp)){
				Iterator iteratorFund=fundsTmp.iterator();

				while(iteratorFund.hasNext()){
					FundVO fundTmp=(FundVO)iteratorFund.next();
					MemberVO member=memberBO.findMemberInfo(fundTmp.getId().getMmember(),fundTmp.getId().getAssociationId());
					if(member!=null){
						fundTmp.setMmember(member);
						funds.add(fundTmp);
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return funds;

	}


	@Override
	public boolean addFund(FundVO fund) throws BusinessException {

		Transaction tx =null;
		boolean saved=true;

		try{

			if(fund!=null) {
				session = hibernateConfig.getSession();
				tx = session.beginTransaction();

				if(fund!=null && StringUtils.isNotEmpty(fund.getId().getMmember())){
					String usernameParts[] = fund.getId().getMmember().split(CommonUtils.COMMA_REGEX, 2);
					fund.getId().setMmember(usernameParts[0]);

					session.saveOrUpdate(FundVO.class.getName(), fund);
					tx.commit();
				}


			}
		}catch(Exception e){
			log.error("Error save fund " +e.getMessage());
			e.printStackTrace();
			tx.rollback();
			saved=false;

		}
		return saved;

	}

	@Override
	public FundVO findByMember(MemberIdVO mbrId) throws BusinessException {

		try{

			BigDecimal totByMember=BigDecimal.ZERO;
			BigDecimal global=BigDecimal.ZERO;
			FundVO fund=null;
			if(mbrId!=null) {
				session = hibernateConfig.getSession();

				Query query=session.getNamedQuery(FundVO.ByMBR_ID);
				query.setParameter("id",mbrId.getName().trim());
				query.setParameter("assId",mbrId.getAssociationId().trim());
				List<FundVO> result =query.list();
				if(CollectionUtils.isNotEmpty(result)){
					for (FundVO f:result) {
						fund=f;
						totByMember=totByMember.add(f.getAmount());
					}
					fund.setTotalByMember(totByMember);
				}
				if(fund!=null){

					String hql1 = "SELECT sum(f.amount)  FROM FundVO f";
					  query = session.createQuery(hql1);
					List results = query.list();
					if(CollectionUtils.isNotEmpty(results)){
						BigDecimal globaltotal= (BigDecimal)results.get(0);
						fund.setGlobalTotal(globaltotal);

					}
					return fund;
				}else{
					return null;
				}
}
		}catch(Exception e){
			log.error("Error retrieve fund " +e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
}
