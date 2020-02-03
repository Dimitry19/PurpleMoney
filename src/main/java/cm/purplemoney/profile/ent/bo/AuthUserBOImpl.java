package cm.purplemoney.profile.ent.bo;

import cam.libraries.component.ent.vo.BusinessException;
import cam.security.password.PasswordUtils;
import cm.purplemoney.common.ent.bo.CommonBOImpl;
import cm.purplemoney.config.HibernateConfig;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.profile.ent.vo.AuthUserVO;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.util.List;

@Component("authUserBO")
public class AuthUserBOImpl extends CommonBOImpl implements AuthUserBO{

	@Resource(name = "hibernateConfig")
	HibernateConfig hibernateConfig;
	Session session;

	public AuthUserVO login(String username, String password) {


		String cryptedPassword=PasswordUtils.getInstance().passwordHashed(password);
		System.out.println(cryptedPassword);
		session= hibernateConfig.getSession();
		Query query=session.createQuery("from AuthUserVO where username =:uName and password=:pwd");

		query.setParameter("uName", username);
		query.setParameter("pwd", cryptedPassword);
		List<AuthUserVO> users=query.list();
		if(users!=null && users.size()>0) {
			return users.get(0);
		}


		return null;
	}


	@Override
	public void saveEditUser(String username,String password,MemberVO memberInfo) {

					session=hibernateConfig.getSession();
					Transaction tx=session.beginTransaction();
			try {
				Query query=null;
				StringBuilder sb=new StringBuilder("update  AuthUserVO set rmember =:memberInfo");

				if( StringUtils.isNotEmpty(memberInfo.getId().getName()) ){
					query=session.createQuery(sb.toString());
					query.setParameter("memberInfo", memberInfo.getId().getName());
				}

				if(memberInfo.isAdmin() && StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)){
					sb.append(" and username=:username and password=:password");
					query=session.createQuery(sb.toString());
					query.setParameter("username", username);
					query.setParameter("password", PasswordUtils.getInstance().passwordHashed(password));
				}
				if(query.executeUpdate()>0){
					tx.commit();
				}else{
					tx.rollback();
				}

			} catch (Exception e) {
				tx.rollback();
				e.printStackTrace();
			}
	}

	@Override
	public AuthUserVO findByMember(String memeberUserInfo) throws BusinessException {
		try{
			session= hibernateConfig.getSession();
			Query query=session.createQuery("from AuthUserVO where rmember =:uName");

			query.setParameter("uName", memeberUserInfo);
			return  (AuthUserVO)query.uniqueResult();
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}


}
