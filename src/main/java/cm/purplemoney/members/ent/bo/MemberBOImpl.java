package cm.purplemoney.members.ent.bo;


import cam.common.CommonUtils;
import cam.libraries.component.ent.vo.BusinessException;
import cam.sql.SQLUtils;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
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
import java.util.ArrayList;
import java.util.List;


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


	

	public MemberVO findMember(String username,String assId) {

		String usernameParts[] = username.split(CommonUtils.SPACE_REGEX, 2);
		session= hibernateConfig.getSession();
		Query query=session.getNamedQuery(MemberVO.FINDBYID);

		query.setParameter("uName", usernameParts[0]);
		query.setParameter("ass", assId.toUpperCase());
		query.setParameter("act", true);
		List<MemberVO> users=decoder(query.list());
		if(users!=null && users.size()>0) {

			return users.get(0);

		}
		return null;

	}


	public MemberVO findMemberFromSession(SessionVO sess) {

		session= hibernateConfig.getSession();
		Query query=session.getNamedQuery(MemberVO.FINDBYSESSION);

		//query.setParameter("uName", sess.getId().getMember());
		query.setParameter("uName", sess.getMembre().getId().getName());
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
		query.setParameter("ass", association);

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
				MemberVO memberTmp=encode(member);
				session=hibernateConfig.getSession();

				Transaction tx=session.beginTransaction();
				session.update(MemberVO.class.getName(),memberTmp);
				tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	@Override
	public String[] autocomplete(String search, String association) throws BusinessException {

		List<String> memberList = new ArrayList<String>();
		session=hibernateConfig.getSession();

		Query query =session.getNamedQuery(MemberVO.Q_AC_ITEM);
				query.setParameter("searchFilter",SQLUtils.forLike(search, true, true, true));
				query.setParameter("ass",association);
		List<MemberVO> results = query.list();

		for(MemberVO member: results){
			memberList.add(member.getId().getName().concat(" ").concat(member.getSurname()) );
		}

		return  (String[]) memberList.toArray(new String[memberList.size()]);

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
		member.setAssociation(association.getId().getId());
		member.setAssociationDesc(association.getDescription());

		if(StringUtils.equals("Femme",member.getSexDesc())){
			member.setSex("F");
		}else{
			member.setSex("M");
		}
		return member;
	}


}
