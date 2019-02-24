package cm.purplemoney.session.usr.action;

import cm.purplemoney.session.ent.bo.SessionBO;
import cm.purplemoney.session.ent.vo.SessionVO;
import cm.purplemoney.session.ent.wrapper.AmountSearchWr;
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
@Component("amountAction")
@Scope("prototype")
public class SessionAction extends BaseAction implements SessionAware,Preparable{
	

	private static final long serialVersionUID = 1L;
	private SessionVO amount;
	private AmountSearchWr amountSearchWr;
	private List members;
	private List<GroupVO> groups=new ArrayList<GroupVO>();
	private List<SessionVO> amounts = new ArrayList<SessionVO>();


	@Resource(name="amountBO")
	SessionBO sessionBO;

	@Resource(name="memberBO")
	MemberBO memberBO;

	@Resource(name = "groupBO")
	GroupBO groupBO;


	@Override
	public void prepare() throws Exception {
		members=memberBO.loadAllMembers();
		groups=groupBO.loadAllGroups();
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
		sessionBO.addAmount(amount);

		//amounts = amountBO.loadAllAmount();
		
		return SUCCESS;
	
	}

	public String specificAllAmounts()throws Exception{
		return SUCCESS;
	}
	public String loadAllAmounts() throws Exception{
		amounts = sessionBO.loadAllAmount();
	
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

    public List<GroupVO> getGroups() {
        return groups;
    }

    public void setGroups(List<GroupVO> groups) {
        this.groups = groups;
    }

	public AmountSearchWr getAmountSearchWr() {
		return amountSearchWr;
	}

	public void setAmountSearchWr(AmountSearchWr amountSearchWr) {
		this.amountSearchWr = amountSearchWr;
	}
}
