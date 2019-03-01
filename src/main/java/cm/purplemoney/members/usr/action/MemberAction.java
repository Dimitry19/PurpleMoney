package cm.purplemoney.members.usr.action;


import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.session.ent.bo.SessionBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.group.ent.bo.GroupBO;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.role.ent.bo.RoleBO;
import com.opensymphony.xwork2.Preparable;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import com.opensymphony.xwork2.validator.annotations.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/*
@Validations(requiredStrings = {
		@RequiredStringValidator(fieldName = "userInfo.association", type = ValidatorType.FIELD, message = "Association is required"),
		@RequiredStringValidator(fieldName = "userInfo.id.name", type = ValidatorType.FIELD, message = "Name is required"),
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
	private MemberVO userSearch;
	private MemberVO userAdding;
	private SessionVO amount;
	private List members;
	private List associations;
	private List roles;
	private SexEnum[] sexEnums;

	private List<SessionVO> sessions = new ArrayList<SessionVO>();





	@Resource(name="authUserBO")
	private AuthUserBO authUserBO;

	@Resource(name="memberBO")
	private MemberBO memberBO;

	@Resource(name = "associationBO")
	private AssociationBO associationBO;

	@Resource(name = "roleBO")
	private RoleBO roleBO;

	@Override
	public void prepare() throws Exception{

		members=memberBO.loadAllMembers();
		associations=associationBO.loadAllAssociations();
		roles=roleBO.loadAllRoles();
		sexEnums = SexEnum.values();
	}


	public void validate(){
		if(userSearch!=null){
			if (StringUtils.isEmpty(userSearch.getId().getName())) {
				addFieldError("userSearch.id.name", getText("common.member.search.error.username"));
			}

			if (StringUtils.isEmpty(userSearch.getAssociation())) {
				addFieldError("userSearch.association", getText("common.member.search.error.association"));
			}
		}
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

	public String allInfoMember()throws Exception {
		// TODO implementer la recherche avec les textfield et penser a l'autocomplete
		String associa=userSearch.getAssociation()!=null?userSearch.getAssociation():getCurrentAssociation().toUpperCase();
		userInfo=memberBO.findMember(userSearch.getId().getName(), associa);
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

	public List getAssociations() {
		return associations;
	}

	public void setAssociations(List associations) {
		this.associations = associations;
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

	public MemberVO getUserSearch() {
		return userSearch;
	}

	public void setUserSearch(MemberVO userSearch) {
		this.userSearch = userSearch;
	}
}
