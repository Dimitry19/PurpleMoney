package cm.purplemoney.group.usr.action;

import cm.purplemoney.session.ent.bo.SessionBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.common.usr.action.BaseAction;

import java.util.ArrayList;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.members.ent.bo.MemberBO;
import java.util.List;
import cm.purplemoney.group.ent.bo.GroupBO;
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
@Component("groupAction")
@Scope("prototype")
public class GroupAction extends BaseAction{
	

	private static final long serialVersionUID = 1L;

	@Resource(name = "sessionBO")
    private SessionBO sessionBO;

	@Resource(name = "memberBO")
	private MemberBO memberBO;
	@Resource(name = "groupBO")
    private GroupBO groupBO;

	SessionVO amount;



	List<SessionVO> amounts = new ArrayList<SessionVO>();
	private List<MemberVO> members ;


	public void prepare() throws Exception {
		//articles=articleBO.retrieveArticles();
		members=memberBO.loadAllMembers();
	}
	
	public String execute() {

		//addActionMessage("Thank you for Registration!");
		//addActionError("A sample Action Error Message!");
		//addActionMessage("A sample Action Message.");
		//addFieldError("error", "A sample Field Error!");
		return SUCCESS;
	}
	public String addAmount() throws Exception{
	
		//article.setCreatedDate(new Date());
		sessionBO.addSession(amount);

		//amounts = amountBO.loadAmounts();
		
		return SUCCESS;
	
	}

	public String loadAllAmounts() throws Exception{
		amounts = sessionBO.loadAllSession();
	
		return SUCCESS;	
	}




	public SessionVO getAmount() {
		return amount;
	}

	public void setAmount(SessionVO amount) {
		this.amount = amount;
	}

	public List<SessionVO> getAmounts() {
		return amounts;
	}

	public void setAmounts(List<SessionVO> amounts) {
		this.amounts = amounts;
	}

	public List<MemberVO> getMembers() {
		return members;
	}

	public void setMembers(List<MemberVO> members) {
		this.members = members;
	}
}
