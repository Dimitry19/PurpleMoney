package cm.purplemoney.members.usr.action;


import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.members.ent.enums.SexEnum;
import cm.purplemoney.role.ent.bo.RoleBO;
import com.opensymphony.xwork2.Preparable;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Component("memberAction")
@Scope("prototype")
public class MemberAction extends BaseAction implements Preparable{

	private static final Logger log = LoggerFactory.getLogger(MemberAction.class);

	private static final long serialVersionUID = 1L;
	private MemberVO userInfo;
	private MemberVO userSearch;
	private MemberVO userAdding;
	private SessionVO amount;
	private List members;
	private List associations;
	private AssociationVO associationCurrent;
	private List roles;
	private SexEnum[] sexEnums;
	private String term;
	private String userInput;
	//private String[] membersNames;
	private List<MemberVO> membersNames;


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

		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		members=memberBO.loadAllMembers(getCurrentAssociation().toUpperCase());
		associations=associationBO.loadAllAssociations();
		associationCurrent=associationBO.associationInfoFromMember(getCurrentMember());
		roles=roleBO.loadAllRoles();
		sexEnums = SexEnum.values();
	}


	public void validate(){
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		if(userSearch!=null){
			if (StringUtils.isEmpty(userSearch.getId().getName())) {
				addFieldError("userSearch.id.name", getText("common.member.search.error.username"));
			}

			/*if (StringUtils.isEmpty(userSearch.getAssociation())) {
				addFieldError("userSearch.association", getText("common.member.search.error.association"));
			}*/
		}
		if (userAdding!=null){
			if(!userAdding.isActive()){
				addActionError("I don't know you, dont try to hack me!");
				addFieldError("userAdding.active", getText("common.member.add.error.active"));
			}
			if(StringUtils.isEmpty(userAdding.getSex())){
				addActionError("I don't know you, dont try to hack me!");
				addFieldError("userAdding.sex", getText("common.member.add.error.gender"));
			}
		}

	}
	public String execute() {

		if (log.isDebugEnabled()){
			debugMessageCall();
		}return SUCCESS;
	}
	 
	public String login() {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		System.out.println(getUserAdding());
		
		return SUCCESS;
	}
	public String info() throws Exception {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		userInfo=memberBO.findMemberInfo(getCurrentUser(), getCurrentAssociation().toUpperCase());

		return SUCCESS;
	}

	public String allInfoMember()throws Exception {
		String associa=userSearch.getId().getAssociationId()!=null?userSearch.getId().getAssociationId():getCurrentAssociation().toUpperCase();
		userInfo=memberBO.findMemberInfo(userSearch.getId().getName(), associa);

		return SUCCESS;
	}

	public String infoMember() throws Exception {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		userInfo=memberBO.findMemberFromSession(amount);

		return SUCCESS;
	}

	public String autocompleteMember() throws Exception{

		if(StringUtils.isNotBlank(userInput)){
			membersNames = memberBO.autocomplete(userInput,getCurrentAssociation().toUpperCase());
		}
			return SUCCESS;
	}

	public String saveEditMember() throws Exception {

	    memberBO.saveEditMember(userInfo);
	    if(StringUtils.equals(userInfo.getId().getName(),getCurrentUser())){
	    	authUserBO.saveEditUser(null, null,userInfo);
		}

		addActionMessage("Nouveau membre correctement ajouté!");
		return SUCCESS;
	}
	public String  showDetailsMember() throws Exception {
		return SUCCESS;
	}

	public String  saveImage() throws Exception {

    	memberBO.saveImage(userInfo);
		return SUCCESS;
	}



	public String addMember() throws Exception {
		log.debug("addMethod");
		memberBO.addMember(userAdding);
		addActionMessage(getText("member.add.success.footer"));

		return SUCCESS;
	}

	public String loadAllMembers() throws Exception{
		members=memberBO.loadAllMembers(getCurrentAssociation().toUpperCase());
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

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getUserInput() {
		return userInput;
	}

	public void setUserInput(String userInput) {
		this.userInput = userInput;
	}

	public List<MemberVO> getMembersNames() {
		return membersNames;
	}

	public void setMembersNames(List<MemberVO> membersNames) {
		this.membersNames = membersNames;
	}

	public AssociationVO getAssociationCurrent() {
		return associationCurrent;
	}

	public void setAssociationCurrent(AssociationVO associationCurrent) {
		this.associationCurrent = associationCurrent;
	}
}
