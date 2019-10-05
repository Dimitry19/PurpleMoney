package cm.purplemoney.role.usr.action;

import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.role.ent.bo.RoleBO;
import cm.purplemoney.role.ent.vo.RoleVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

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
@Component("roleAction")
@Scope("prototype")
public class RoleAction extends BaseAction{
	

	private static final long serialVersionUID = 1L;

	@Resource(name = "roleBO")
	RoleBO roleBO;

	RoleVO role;
	private List<RoleVO> roleNames;
	private String userInput;

	private List roles ;


	public void prepare() throws Exception {

	}
	
	public String execute() {

		//addActionMessage("Thank you for Registration!");
		//addActionError("A sample Action Error Message!");
		//addActionMessage("A sample Action Message.");
		//addFieldError("error", "A sample Field Error!");
		return SUCCESS;
	}
	public String addRole() throws Exception{
		//article.setCreatedDate(new Date());
		roleBO.addRole(role);
		return SUCCESS;
	}
	public String autocompleteRole() throws Exception{

		if(StringUtils.isNotBlank(userInput)){
			roleNames=roleBO.autocompleteRole(userInput);
		}

		return SUCCESS;

	}

	public String loadAllRoles() throws Exception{
		roles = roleBO.loadAllRoles();
	
		return SUCCESS;	
	}

	public List<RoleVO> getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(List<RoleVO> roleNames) {
		this.roleNames = roleNames;
	}
	public String getUserInput() {
		return userInput;
	}

	public void setUserInput(String userInput) {
		this.userInput = userInput;
	}

	public RoleVO getRole() {
		return role;
	}

	public void setRole(RoleVO role) {
		this.role = role;
	}

	public List getRoles() {
		return roles;
	}

	public void setRoles(List roles) {
		this.roles = roles;
	}
}
