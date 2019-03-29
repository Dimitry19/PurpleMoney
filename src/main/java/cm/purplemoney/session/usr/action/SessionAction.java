package cm.purplemoney.session.usr.action;

import cm.purplemoney.session.ent.bo.SessionBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.session.ent.wrapper.SessionSearchWr;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.group.ent.bo.GroupBO;
import cm.purplemoney.group.ent.vo.GroupVO;
import com.opensymphony.xwork2.Preparable;
import java.util.ArrayList;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.members.ent.bo.MemberBO;
import java.util.List;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/*
@Validations(requiredStrings = {
		@RequiredStringValidator(fieldName = "user", type = ValidatorType.FIELD, message = "Username is required"),
		@RequiredStringValidator(fieldName = "password", type = ValidatorType.FIELD, message = "Password is required"),
		@RequiredStringValidator(fieldName = "favourite", type = ValidatorType.FIELD, message = "Choose your Favourite Color"),
		@RequiredStringValidator(fieldName = "biograhy", type = ValidatorType.FIELD, message = "Biography is required")
}, expressions = {
		@ExpressionValidator(expression = "password.trim().length() > 5", message = "Password must have as minimum 6 Characters.")
}, fieldExpressions = {
		@FieldExpressionValidator(fieldName = "password", expression = "password.trim().length() > 6", message = "Password must have as minimum 6 Characters."),
		@FieldExpressionValidator(fieldName = "agree", expression = "agree == true", message = "Accept the Agreement.")
})*/
@Component("sessionAction")
@Scope("prototype")
public class SessionAction extends BaseAction implements SessionAware,Preparable{
	

	private static final long serialVersionUID = 1L;
	private SessionVO amountSession;
	private SessionSearchWr sessionSearchWr;
	private List members;
	private List<GroupVO> groups=new ArrayList<GroupVO>();
	private List<SessionVO> sessions = new ArrayList<SessionVO>();


	@Resource(name="sessionBO")
	private SessionBO sessionBO;

	@Resource(name="memberBO")
	private MemberBO memberBO;

	@Resource(name = "groupBO")
	private GroupBO groupBO;


	@Override
	public void prepare() throws Exception {
		members=memberBO.loadAllMembers(currentAssociation.toUpperCase());
		groups=groupBO.loadAllGroups();
	}
	
	public String execute() {

		//addActionMessage("Thank you for Registration!");
		//addActionError("A sample Action Error Message!");
		//addActionMessage("A sample Action Message.");
		//addFieldError("error", "A sample Field Error!");
		return SUCCESS;
	}
	public String addSession() throws Exception{

		sessionBO.addSession(amountSession);

		return SUCCESS;
	
	}

	public String specificAllSessions()throws Exception{

	    sessionBO.consultSession(sessionSearchWr);
		return SUCCESS;
	}
	public String loadAllSessions() throws Exception{
		sessions = sessionBO.loadAllSession();
	
		return SUCCESS;	
	}


	public SessionVO getAmountSession() {
		return amountSession;
	}

	public void setAmountSession(SessionVO amountSession) {
		this.amountSession = amountSession;
	}

	public List<SessionVO> getSessions() {
		return sessions;
	}

	public void setSessions(List<SessionVO> sessions) {
		this.sessions = sessions;
	}

	public List<MemberVO> getMembers() {
		return members;
	}

	public void setMembers(List<MemberVO> members) {
		this.members = members;
	}

    public List<GroupVO> getGroups() {
        return groups;
    }

    public void setGroups(List<GroupVO> groups) {
        this.groups = groups;
    }

	public SessionSearchWr getSessionSearchWr() {
		return sessionSearchWr;
	}

	public void setSessionSearchWr(SessionSearchWr sessionSearchWr) {
		this.sessionSearchWr = sessionSearchWr;
	}
}
