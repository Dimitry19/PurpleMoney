package cm.purplemoney.loan.usr.action;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.loan.ent.bo.LoanBO;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.role.ent.bo.RoleBO;
import com.opensymphony.xwork2.Preparable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("loanAction")
@Scope("prototype")
public class LoanAction extends BaseAction implements Preparable {


	private static final Logger log = LoggerFactory.getLogger(LoanAction.class);
	private List loans;

	@Resource(name="authUserBO")
	private AuthUserBO authUserBO;

	@Resource(name="memberBO")
	private MemberBO memberBO;

	@Resource(name = "associationBO")
	private AssociationBO associationBO;

	@Resource(name = "roleBO")
	private RoleBO roleBO;

	@Resource(name="loanBO")
	private LoanBO loanBO;



	@Override
	public void prepare() throws Exception {

		loans=loanBO.loans();
	}

	public String execute() {

		if (log.isDebugEnabled()){
			debugMessageCall();
		}return SUCCESS;
	}

	public String loans() throws BusinessException {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		loanBO.loans();
		return SUCCESS;
	}

	public String add() throws BusinessException {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		return SUCCESS;
	}

	public List getLoans() {
		return loans;
	}

	public void setLoans(List loans) {
		this.loans = loans;
	}
}
