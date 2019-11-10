package cm.purplemoney.members.ent.bo;


import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cam.sql.SQLUtils;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.common.ent.vo.WidgetDataInfoVO;
import cm.purplemoney.common.ent.vo.WidgetVO;
import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.sanction.ent.vo.SanctionVO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.bo.RoleBO;
import cm.purplemoney.role.ent.vo.RoleVO;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import javax.persistence.TypedQuery;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;


@Component("memberBO")
public class MemberBOImpl implements MemberBO {
	private static final Logger log = LoggerFactory.getLogger(MemberBOImpl.class);

	@Resource(name = "hibernateConfig")
	HibernateConfig hibernateConfig;

	@Resource(name = "roleBO")
	RoleBO roleBO;
	@Resource(name = "associationBO")
	AssociationBO associationBO;

	Session session;



	public  List<MemberVO>  findMember(String username,String assId) {

		session= hibernateConfig.getSession();
		Query query=null;


			String usernameParts[] = username.split(CommonUtils.SPACE_REGEX, 2);
			query=session.getNamedQuery(MemberVO.LIKEID);
			query.setParameter("uName",SQLUtils.forLike(usernameParts[0].toUpperCase(), true, true, true));

			//query.setParameter("ass", assId.toUpperCase());
			//query.setParameter("act", true);
			List<MemberVO> users=decoder(query.list());
			if(users!=null && users.size()>0) {

				return users;
			}
		return null;
	}

	public  MemberVO  findMemberInfo(String username,String assId) {

		List<MemberVO> users=findMember(username,  assId);
		if(users!=null && users.size()>0) {
			return users.get(0);
		}
		return null;

	}


	public MemberVO findMemberFromSession(SessionVO sess) {

		session= hibernateConfig.getSession();
		Query query=session.getNamedQuery(MemberVO.FINDBYSESSION);

		//query.setParameter("uName", sess.getId().getMember());
		query.setParameter("uName", sess.getMmember().getId().getName());
		query.setParameter("ass", sess.getId().getAssociationId());
		List<MemberVO> users=decoder(query.list());
		if(users!=null && users.size()>0) {
			return users.get(0);
		}
		return null;

	}

	@Override
	public List<MemberVO> loadAllMembers(String association) {
		session=hibernateConfig.getSession();
		Query query=session.getNamedQuery(MemberVO.ALL);
		//query.setParameter("ass", association);
		//query.setParameter("act", true);

		List<MemberVO> members= null;
		try {
			members = decoder(query.list());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return members;
	}

	@Override
	public void addMember(MemberVO member) throws BusinessException{
		if(member!=null){
			session=hibernateConfig.getSession();

			Transaction tx=session.beginTransaction();
			Serializable serializable=session.save(MemberVO.class.getName(),member);
			if(serializable!=null){
				roleBO.updateRoleByMember(member.getRole());
			}
			tx.commit();
		}
	}

	@Override
	public void saveEditMember(MemberVO member) {

		if(member!=null){
			try {
				String usernameParts[] = member.getId().getName().split(CommonUtils.COMMA_REGEX, 2);
				if(usernameParts.length==1){
					MemberVO memberTmp=encode(member);
					session=hibernateConfig.getSession();

					Transaction tx=session.beginTransaction();
					session.update(MemberVO.class.getName(),memberTmp);
					tx.commit();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	public WidgetVO widgetInfo(String username, String association) throws BusinessException {
		WidgetVO widget=new WidgetVO();

		MemberVO mbr=findMemberInfo(username,  association);

		widget.setCommonFound(BigDecimal.TEN);
		widget.setPersonalFound(BigDecimal.TEN);
		widget.setLoans(calcolateLoan(mbr));
		widget.setSanctions(calcolateSanction(mbr));
		widget.setWidgetDataInfos(retrieveWidgetDataInfo(mbr));

		return widget;
	}

	private BigDecimal calcolateSanction(MemberVO mbr){

		BigDecimal total=BigDecimal.ZERO;
		if(mbr!=null){
			Iterator iterator=mbr.getSanctions().iterator();
			while (iterator.hasNext()){
				SanctionVO sction=(SanctionVO)iterator.next();
				total=total.add(sction.getDecodeSanction().getTax());
			}
		}
		return total;
	}

	private List retrieveWidgetDataInfo(MemberVO mbr){

		List widgetDataInfos=new ArrayList();
		if(mbr!=null){
			Iterator iterator=mbr.getLoans().iterator();
			while (iterator.hasNext()){
				LoanVO loan=(LoanVO)iterator.next();
				WidgetDataInfoVO widgetDataInfo=new WidgetDataInfoVO();

				Date date=loan.getLoanDate();
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				widgetDataInfo.setYear(cal.get(Calendar.YEAR));
				widgetDataInfo.setMonth(cal.get(Calendar.MONTH));
				widgetDataInfo.setDate(date);
				widgetDataInfo.setAmount(loan.getAmountToBack());
				widgetDataInfos.add(widgetDataInfo);
			}
		}
		return widgetDataInfos;
	}

	private BigDecimal calcolateLoan(MemberVO mbr){

		BigDecimal total=BigDecimal.ZERO;
		if(mbr!=null){
			Iterator iterator=mbr.getLoans().iterator();
			while (iterator.hasNext()){
				LoanVO loan=(LoanVO)iterator.next();
				Date date=loan.getLoanDate();
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH);
				int day = cal.get(Calendar.DAY_OF_MONTH);
				total=total.add(loan.getAmountToBack());
			}
		}
		return total;
	}
	@Override
	public List<MemberVO> autocomplete(String search, String association) throws BusinessException {

		//List<String> memberList = new ArrayList<String>();
		session=hibernateConfig.getSession();

		Query query =session.getNamedQuery(MemberVO.Q_AC_ITEM);
				query.setParameter("searchFilter",SQLUtils.forLike(search, true, true, true));
		//		query.setParameter("ass",association);
		List<MemberVO> memberList = query.list();

		return memberList;
		//for(MemberVO member: results){
		//	memberList.add(member.getId().getName().concat(" ").concat(member.getSurname()) );
		//}

		//return memberList;

		//return  (String[]) memberList.toArray(new String[memberList.size()]);

	}

	private List<MemberVO>  decoder(List<MemberVO> mbrs) {

		List<MemberVO> members=new ArrayList<MemberVO>();

		try {
				for (MemberVO mb : mbrs) {
					decode(mb);
					members.add(mb);
			}
		}catch (Exception e){
			log.error("Decoder error");
			e.printStackTrace();
		}
		return members;
	}

	protected void decode(MemberVO member) throws Exception{
		if(session.isOpen()){
			session.close();
		}
		RoleVO role=roleBO.retrieveRoleFromMember(member);
		AssociationVO association=associationBO.associationInfoFromMember(member);
		member.setAssociationDesc(association.getDescription());
		member.setRoleDesc(role.getDescription());
		if(member.getSex().charAt(0) == 'F'){
			member.setSexDesc("Femme");
			member.setMale(false);
		}else{
			member.setSexDesc("Homme");
			member.setMale(true);
		}
	}

	protected MemberVO encode( MemberVO member) throws Exception{

		if( session.isOpen()){
			session.close();
		}
		RoleVO role=roleBO.retrieveRoleFromMember(member);
		AssociationVO association=associationBO.associationInfoFromMember(member);
		member.setRole(role.getId().getRole());
		member.setAssociationDesc(association.getDescription());

		if(StringUtils.equals("Femme",member.getSexDesc())){
			member.setSex("F");
		}else{
			member.setSex("M");
		}
		return member;
	}


}
