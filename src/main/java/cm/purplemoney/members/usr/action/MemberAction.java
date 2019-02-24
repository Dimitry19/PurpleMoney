package cm.purplemoney.members.usr.action;


import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.group.ent.bo.GroupBO;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.role.ent.bo.RoleBO;
import com.opensymphony.xwork2.Preparable;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/*
@Validations(requiredStrings = {
		@RequiredStringValidator(fieldName = "username", type = ValidatorType.FIELD, message = "Username is required"),
		@RequiredStringValidator(fieldName = "password", type = ValidatorType.FIELD, message = "Password is required"),
},
		emails={	@EmailValidator(fieldName = "email" ,type=ValidatorType.FIELD,message = "Entrez une adresse email valide")
		},
		expressions = {
				@ExpressionValidator(expression = "password.trim().length() > 5", message = "Password must have as minimum 6 Characters.")
		}, fieldExpressions = {
		@FieldExpressionValidator(fieldName = "password", expression = "password.trim().length() > 6", message = "Password must have as minimum 6 Characters."),
		@FieldExpressionValidator(fieldName = "agree", expression = "agree == true", message = "Accept the Agreement.")
})
*/

@Component("memberAction")
@Scope("prototype")
public class MemberAction extends BaseAction implements SessionAware,Preparable{

	private static final Logger log = LoggerFactory.getLogger(MemberAction.class);

	private static final long serialVersionUID = 1L;
	private MemberVO userInfo;
	private MemberVO userAdding;
	private SessionVO amount;
	private List members;
	private List groups;
	private List roles;
	private SexEnum[] sexEnums;



	@Resource(name="authUserBO")
	AuthUserBO authUserBO;

	@Resource(name="memberBO")
	MemberBO memberBO;

	@Resource(name = "groupBO")
	GroupBO groupBO;

	@Resource(name = "roleBO")
    RoleBO roleBO;

	@Override
	public void prepare() throws Exception{

		groups=groupBO.loadAllGroups();
		roles=roleBO.loadAllRoles();
		sexEnums = SexEnum.values();
	}
	
	public String execute() {
		return SUCCESS;
	}
	 
	public String login() {
		System.out.println(getUserAdding());
		
		return SUCCESS;
	}
	public String info() throws Exception {

		userInfo=memberBO.findMember(getCurrentUser(), getCurrentAssociation().toUpperCase());

		return SUCCESS;
	}

	public String infoMember() throws Exception {

		userInfo=memberBO.findMember(amount);

		return SUCCESS;
	}


	public String saveEditMember() throws Exception {

	    memberBO.saveEditMember(userInfo);
		authUserBO.saveEditUser(null, null,userInfo);

		//addActionMessage("Nouveau membre correctement ajouté!");
		return SUCCESS;
	}

	public String addMember() throws Exception {
		log.debug("addMethod");

		memberBO.addMember(userAdding);

		//addActionMessage("Nouveau membre correctement ajouté!");
		return SUCCESS;
	}

	public String loadAllMembers() throws Exception{
		members=memberBO.loadAllMembers();
		return SUCCESS;
	}


	public SessionVO getAmount() {
		return amount;
	}

	public void setAmount(SessionVO amount) {
		this.amount = amount;
	}

	public String index() {
	return SUCCESS;
	}
	 
	public String delete() {

		return SUCCESS;
	}
	 
	public MemberVO getUserInfo() {
		return userInfo;
	}
		 
	public void setUserInfo(MemberVO usr) {
		this.userInfo = usr;
	}

	public List getMembers() {
		return members;
	}

	public void setMembers(List members) {
		this.members = members;
	}

	public List getGroups() {
		return groups;
	}

	public void setGroups(List groups) {
		this.groups = groups;
	}


	public List getRoles() {
		return roles;
	}

	public void setRoles(List roles) {
		this.roles = roles;
	}


	public MemberVO getUserAdding() {
		return userAdding;
	}

	public void setUserAdding(MemberVO userAdding) {
		this.userAdding = userAdding;
	}

	public SexEnum[] getSexEnums() {
		return sexEnums;
	}
	public void setSexEnums(SexEnum[] sexEnums ) {
		this.sexEnums = sexEnums ;
	}


 }
