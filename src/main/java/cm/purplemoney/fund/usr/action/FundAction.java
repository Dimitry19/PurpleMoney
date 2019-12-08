package cm.purplemoney.fund.usr.action;

import cam.libraries.component.ent.vo.BusinessException;
import cm.purplemoney.association.ent.bo.AssociationBO;
import cm.purplemoney.association.ent.vo.AssociationVO;
import cm.purplemoney.common.usr.action.BaseAction;
import cm.purplemoney.fund.ent.bo.FundBO;
import cm.purplemoney.fund.ent.vo.FundVO;
import cm.purplemoney.members.ent.bo.MemberBO;
import cm.purplemoney.members.ent.vo.MemberVO;
import cm.purplemoney.profile.ent.bo.AuthUserBO;
import cm.purplemoney.role.ent.bo.RoleBO;
import com.opensymphony.xwork2.Preparable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component("fundAction")
@Scope("prototype")
public class FundAction extends BaseAction implements Preparable {


	private static final Logger log = LoggerFactory.getLogger(FundAction.class);
	private List funds;


	@Resource(name = "associationBO")
	private AssociationBO associationBO;

	@Resource(name="fundBO")
	private FundBO fundBO;

	private FundVO fund;
	private AssociationVO associationCurrent;




	@Override
	public void prepare() throws Exception {

		funds= fundBO.funds();
		associationCurrent=associationBO.associationInfoFromMember(getCurrentMember());

	}

	public String execute() {

		if (log.isDebugEnabled()){
			debugMessageCall();
		}return SUCCESS;
	}

	public String funds() throws BusinessException {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		funds=fundBO.funds();
		return SUCCESS;
	}

	public String add() throws BusinessException {
		if (log.isDebugEnabled()){
			debugMessageCall();
		}
		if(fundBO.addFund(fund)){
			addActionMessage(getText("loan.add.success"));
			loadWidgetInfo(true);
		}else{
			addActionError(getText("loan.add.error"));
		}

		return SUCCESS;
	}


	public List getFunds() {
		return funds;
	}

	public void setFunds(List funds) {
		this.funds = funds;
	}

	public FundVO getFund() {
		return fund;
	}

	public void setFund(FundVO fund) {
		this.fund = fund;
	}

	public AssociationVO getAssociationCurrent() {
		return associationCurrent;
	}

	public void setAssociationCurrent(AssociationVO associationCurrent) {
		this.associationCurrent = associationCurrent;
	}
}
