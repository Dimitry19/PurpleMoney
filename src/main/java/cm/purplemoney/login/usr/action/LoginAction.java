package cm.purplemoney.login.usr.action;

import java.util.*;

import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.common.ent.bo.LanguageBO;
import cm.purplemoney.common.ent.vo.LanguageVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang3.StringUtils;
import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.profile.ent.vo.AuthUserVO;
import org.apache.struts2.interceptor.I18nInterceptor;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static cm.purplemoney.constants.PortalConstants.*;

@Component("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction implements Preparable{

	private static final long serialVersionUID = -3369875299120377549L;
	
	private Logger logger = (Logger) LoggerFactory.getLogger(LoginAction.class);
	
	private AuthUserVO user;
	List associations ;
	List languages;
	private String rLocale;


	@Resource(name="authUserBO")
	AuthUserBO authUserBO;

	@Resource(name ="memberBO")
	MemberBO memberBO;

	@Resource(name ="languageBO")
	LanguageBO languageBO;

	@Resource(name = "associationBO")
	AssociationBO associationBO;
	private String rlocale;

	@Override
	public void prepare() throws Exception{
		languages=languageBO.loadAllLanguages();//Arrays.asList(LanguageEnum.values());
		associations= associationBO.loadAllAssociations();
	}
	@Override
	public String execute() throws Exception{

		return SUCCESS;
	}

	/*public void validate(){

		if ( StringUtils.isEmpty(user.getUsername()) ){

			addFieldError( "common.error.username", "First name is required." );

		}

		if ( StringUtils.isEmpty(user.getPassword())){

			addFieldError( "common.error.password", "Password is required." );

		}

	}*/
	
	public String login() throws Exception{
        logger.debug("into login method");
        // TODO Voir comment arranger le code du login
		saveToSession(LOCALE,changelocaleMenu());
        if(StringUtils.equals(ADMINISTRATOR, user.getUsername())){

            if(user.isRemember()){
                this.session.put(ADMIN_SESSION, user);
            }
			saveToSession(CURRENT_USER, user);
			saveToSession(CURRENT_ASS, user.getAssociation());
	        saveToSession(TO_SESSION, user);

            return SUCCESS;
        }

		boolean isLogin=true;
		boolean isSuccess=false;
		Object adminSessionUser=this.session.get(ADMIN_SESSION);


		if(adminSessionUser!=null){
			AuthUserVO us=(AuthUserVO) adminSessionUser;
			isLogin=doLogin(us, null);
			if(isLogin){
				Object sessionUser=this.session.get(MEMBER_SESSION);
				if(sessionUser!=null){
					MemberVO mb=(MemberVO) sessionUser;
					isLogin=doLogin(null,mb);
				}
			}
		}

		if(isLogin){
				if(authUserBO==null || memberBO==null) {
					return INPUT;
				}
				AuthUserVO authUser= authUserBO.login(user.getUsername(), user.getPassword());

				if(authUser!=null ) {
					if(StringUtils.equals(ADMINISTRATOR, authUser.getUsername())){
							isSuccess=true;
							if(user.isRemember()){
								saveToSession(ADMIN_SESSION, user);
							}


					}else{
						MemberVO member = memberBO.findMember(authUser.getRmember(),user.getAssociation());
						if(member!=null){
							isSuccess=true;
							if(user.isRemember()){
								saveToSession(MEMBER_SESSION, member);
								saveToSession(USR_SESSION,user.getUsername());
								saveToSession(PASS_SESSION,user.getPassword());
								saveToSession(REM_SESSION,user.isRemember());
								saveToSession(ASS_SESSION,user.getAssociation());
							}
						}
					}
					saveToSession(CURRENT_USER, authUser.getRmember());
					saveToSession(CURRENT_ASS, user.getAssociation());
					saveToSession(TO_SESSION, user);

				}
			}else{
				return SUCCESS;
		}
		if(isSuccess) {
			return SUCCESS;
		}

		addActionError(getText("common.login.error"));
		return INPUT;
	}

	void saveToSession(Object key , Object value){
		this.session.put(key,value);

	}
	public String home() throws Exception{
		
		return SUCCESS;
	}

	public String logout() throws Exception{

	    AuthUserVO userLocal=new AuthUserVO();
		Object adminSessionUser=this.session.get(ADMIN_SESSION);
		Locale locale =(Locale)this.session.get(LOCALE);
		userLocal.setLanguage(locale.getLanguage());
        if(adminSessionUser!=null){
            AuthUserVO us=(AuthUserVO) adminSessionUser;
            userLocal.setUsername(us.getUsername());
            userLocal.setPassword(us.getPassword());
            userLocal.setRemember(us.isRemember());
        }else{
            Object sessionUser=this.session.get(MEMBER_SESSION);
            MemberVO mb=(MemberVO) sessionUser;
            if(sessionUser!=null){
            	userLocal.setUsername((String) this.session.get(USR_SESSION));
                userLocal.setPassword((String) this.session.get(PASS_SESSION));
				userLocal.setAssociation((String) this.session.get(ASS_SESSION));
                userLocal.setRemember(this.session.get(REM_SESSION)!=null);
            }
        }
        if(!StringUtils.isEmpty(userLocal.getUsername())){

            this.user=userLocal;
        }
		this.session.clear();
        addActionMessage(getText("common.logout.success"));

		return SUCCESS;
	}




	public AuthUserVO getUser() {
		return user;
	}
		 
	public void setUser(AuthUserVO usr) {
		this.user = usr;
	}


	private boolean doLogin(AuthUserVO us,MemberVO mb){
		if (us!=null){
			return (!StringUtils.equals(us.getUsername(),user.getUsername()) || !StringUtils.equals(us.getPassword(),user.getPassword()));
		}
		if(mb!=null){
			return (StringUtils.isEmpty(mb.getId().getName()));
		}
		return true;
	}

	public List getAssociations() {
		return associations;
	}

	public void setAssociations(List associations) {
		this.associations = associations;
	}

	public List getLanguages() {
		return languages;
	}

	public void setLanguages(List languages) {
		this.languages = languages;
	}


	public Locale  changelocaleMenu() throws Exception{
		changeLanguages(true);
		return currlocale;
	}

	public String  changelocale() throws Exception{
		saveToSession(LOCALE,changeLanguages(false));
		return SUCCESS;
	}

	private Locale changeLanguages(boolean fromLogin) throws Exception{
		Map<String, Object> sessionAttributes =getSession();
		Locale cLocale=Locale.getDefault();

		if(fromLogin){
			if(StringUtils.isNotEmpty(user.getLanguage())){

				LanguageVO language =languageBO.retrieveLanguage(user.getLanguage());
				cLocale= new Locale(language.getId(),language.getCountry());
			}
		}else{
				LanguageVO language =languageBO.retrieveLanguage(getRlocale());
				cLocale= new Locale(language.getId(),language.getCountry());
		}

		currlocale=cLocale;
		ActionContext.getContext().setLocale(cLocale);
		sessionAttributes.put(I18nInterceptor.DEFAULT_SESSION_ATTRIBUTE, cLocale);
		return cLocale;
	}
	public void setRlocale(String rlocale) {
		this.rlocale = rlocale;
	}

	public String getRlocale() {
		return rlocale;
	}
}