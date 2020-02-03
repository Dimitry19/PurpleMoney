package cm.purplemoney.loan.usr.action;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.constants.PortalConstants;
import cm.purplemoney.loan.ent.bo.LoanBO;
import cm.purplemoney.loan.ent.vo.LoanVO;
import cm.purplemoney.loan.ent.vo.LoanWrapper;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.role.ent.bo.RoleBO;
import com.opensymphony.xwork2.Preparable;
import org.apache.commons.lang3.StringUtils;
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

	private LoanVO loan;
	private AssociationVO associationCurrent;




	@Override
	public void prepare() throws Exception {

		loans=loanBO.loans();
		associationCurrent=associationBO.associationInfoFromMember(getCurrentMember());
		tax=PortalConstants.DEFAULT_TAX_NUMBER;
	}

	public void validate(){
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		if(loan!=null){
			if (StringUtils.isEmpty(loan.getId().getMmember())) {
				addFieldError("userSearch.id.name", getText("common.member.search.error.username"));
			}

			if (StringUtils.isEmpty(loan.getId().getAssociationId())) {
				addFieldError("userSearch.association", getText("common.member.search.error.association"));
			}
		}

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
		loans=loanBO.loans();
		return SUCCESS;
	}

	public String addLoan() throws BusinessException {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}

		if(loanBO.addLoan(loan,getCurrentLocale())){
			addActionMessage(getText("loan.add.success"));
			loadWidgetInfo(true);
		}else{
			addActionError(getText("loan.add.error"));
		}

		return SUCCESS;
	}


	public List getLoans() {
		return loans;
	}

	public void setLoans(List loans) {
		this.loans = loans;
	}

	public LoanVO getLoan() {
		return loan;
	}

	public void setLoan(LoanVO loan) {
		this.loan = loan;
	}

	public AssociationVO getAssociationCurrent() {
		return associationCurrent;
	}

	public void setAssociationCurrent(AssociationVO associationCurrent) {
		this.associationCurrent = associationCurrent;
	}
}
